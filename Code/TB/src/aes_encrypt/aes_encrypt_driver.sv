class aes_encrypt_driver extends uvm_driver#(aes_encrypt_transaction);;
  `uvm_component_utils(aes_encrypt_driver)

  virtual aes_intf vif;

//-----------------------------------------------------------------------------
// Constructor
//-----------------------------------------------------------------------------
  function new (string name = "aes_encrypt_driver", uvm_component parent);
    super.new (name, parent);
  endfunction : new 
//-----------------------------------------------------------------------------
// Task: build_phase
//-----------------------------------------------------------------------------
function void build_phase(uvm_phase phase);
  super.build_phase(phase);
    if (!uvm_config_db #(virtual aes_intf)::get (this, "", "vif", vif)) begin
       `uvm_error (get_type_name (), "DUT interface not found");
    end
endfunction :build_phase

  task run_phase (uvm_phase phase);
    super.run_phase(phase);
  // take data from sequencer and drive to DUT
    forever begin
      aes_encrypt_transaction item;
      seq_item_port.get_next_item(item);
      drive(item);
      seq_item_port.item_done();
    end
  endtask : run_phase
//-----------------------------------------------------------------------------
// Task: drive
//-----------------------------------------------------------------------------
  task drive(aes_encrypt_transaction item);
    @(negedge vif.clk)
    if (!vif.reset_n) begin
      vif.plain_text_in   <= 0;
      vif.cipher_key_in   <= 0;
      vif.cipher_new_en   <= 0;
      vif.en              <= 0;
    end

    else begin
      vif.plain_text_in   <= item.plain_text_in;
      vif.cipher_key_in   <= item.cipher_key_in;
      vif.cipher_new_en   <= item.cipher_new_en;
      vif.en              <= item.en;
      @(posedge vif.clk)
      vif.cipher_new_en <= 0;
    end 

    forever begin
      @(posedge vif.clk);
      if(vif.cipher_ready) begin
        repeat(3) @(posedge vif.clk);
        break;
      end
      else continue;
    end

    `uvm_info ("ENCRYPT_DRIVER", "SEND DATA", UVM_LOW)
    
  endtask : drive 

endclass : aes_encrypt_driver