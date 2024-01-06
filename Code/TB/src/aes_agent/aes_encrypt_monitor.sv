class aes_encrypt_monitor extends uvm_monitor;
  `uvm_component_utils(aes_encrypt_monitor)

  uvm_analysis_port #(aes_encrypt_transaction) encrypt_ap_port;
  virtual aes_intf vif;

//-----------------------------------------------------------------------------
// function : Constructor
//-----------------------------------------------------------------------------
  function new (string name = "aes_encrypt_monitor", uvm_component parent = null);
    super.new (name, parent);
  endfunction 
//-----------------------------------------------------------------------------
// function : build_phase 
//-----------------------------------------------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
        encrypt_ap_port = new ("encrypt_ap_port",this);
    if (!uvm_config_db #(virtual aes_intf)::get (this, "", "vif", vif)) begin
       `uvm_error (get_type_name (), "DUT interface not found");
    end
  endfunction
//-----------------------------------------------------------------------------
// function : run_phase 
//-----------------------------------------------------------------------------
  task run_phase (uvm_phase phase);
    collect_data();
  endtask : run_phase

  task collect_data();
    aes_encrypt_transaction item = new aes_encrypt_transaction::type_id::create("item");
    forever begin 
    @(posedge vif.decipher_ready)
    @(posedge vif.clk)
      item.plain_text_in = vif.plain_text_in;
      item.plain_text_out = vif.plain_text_out;
      encrypt_ap_port.write(item);
    end 
  endtask : collect_data

endclass : aes_encrypt_monitor