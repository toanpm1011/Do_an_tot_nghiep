// UVM TLM macros _decl: define 2 analysis import to connect to tx_agent and rx_agent
//`uvm_analysis_imp_decl(_encrypt)
//`uvm_analysis_imp_decl(_decrypt)

class aes_scoreboard extends uvm_scoreboard;  
	`uvm_component_utils(aes_scoreboard)

  uvm_analysis_imp #(aes_encrypt_transaction, aes_scoreboard) encrypt_ap_imp;
  //uvm_analysis_imp_decrypt #(aes_decrypt_transaction, aes_scoreboard) decrypt_ap_imp;
//-----------------------------------------------------------------------------
// function : new
//-----------------------------------------------------------------------------
  function new (string name = "aes_scoreboard", uvm_component parent = null);
    super.new (name, parent);
  endfunction : new 
//-----------------------------------------------------------------------------
// function : build_phase
//-----------------------------------------------------------------------------
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    encrypt_ap_imp = new ("encrypt_ap_imp", this);
    //decrypt_ap_imp = new ("decrypt_ap_imp", this);
  endfunction
//-----------------------------------------------------------------------------
// function : write_tx
// Compare data from TX_DUT
//-----------------------------------------------------------------------------
  virtual function void write(aes_encrypt_transaction item);
  	if (item.plain_text_in == item.plain_text_out) begin
      `uvm_info ("UVM_INFO","PASS!", UVM_LOW)
      $display("plain_text_in = %h , plain_text_out = %h",  item.plain_text_in, item.plain_text_out);//, ; //  */
    end
      //`uvm_error ("UVM_ERROR","CHECK Failed!")
  endfunction : write

endclass : aes_scoreboard