class aes_decrypt_driver extends uvm_driver#(aes_decrypt_transaction);;
  `uvm_component_utils(aes_decrypt_driver)

  virtual aes_intf vif;
  logic [127:0] cipher_key_in;
  logic [127:0] round_key_10;


//-----------------------------------------------------------------------------
// Constructor
//-----------------------------------------------------------------------------
  function new (string name = "aes_decrypt_driver", uvm_component parent);
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
    // forever begin
    //   aes_decrypt_transaction item;
    //   seq_item_port.get_next_item(item);
    //   drive(item);
    //   seq_item_port.item_done();
    // end
  endtask : run_phase
//-----------------------------------------------------------------------------
// Task: drive
//-----------------------------------------------------------------------------
  task drive(aes_decrypt_transaction item);

  //   forever begin
  //     @(posedge vif.clk)
  //     cipher_key_in <= vif.cipher_text_out;
  //     round_key_10  <= vif.round_key_10;
  //   end 

  //  if (vif.cipher_ready) begin
  //     @(negedge vif.clk)
  //       vif.cipher_key_in   <= cipher_key_in;
  //       vif.round_key_10    <= round_key_10;
  //       vif.EN              <= item.EN;
  //       vif.decipher_new_en <= item.decipher_new_en;
  //       @(negedge vif.clk) 
  //       vif.decipher_new_en <= 0;

  //   if (vif.decipher_ready)
  //     @(pos)
  //   end 
  //   `uvm_info ("TX_DRIVER", "SEND DATA", UVM_LOW)
    
  endtask : drive 

endclass : aes_decrypt_driver