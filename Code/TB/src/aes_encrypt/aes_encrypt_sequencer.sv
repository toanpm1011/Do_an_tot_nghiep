class aes_encrypt_sequencer extends uvm_sequencer#(aes_encrypt_transaction);
	`uvm_component_utils(aes_sequencer)
//-----------------------------------------------------------------------------
// function : new 
//-----------------------------------------------------------------------------
	function new(string name = "aes_encrypt_sequencer", uvm_component parent = null);
		super.new (name, parent);
	endfunction : new

endclass : aes_encrypt_sequencer