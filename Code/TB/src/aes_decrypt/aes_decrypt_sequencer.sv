class aes_decrypt_sequencer extends uvm_sequencer#(aes_decrypt_transaction);
	`uvm_component_utils(aes_decrypt_sequencer)
//-----------------------------------------------------------------------------
// function : new 
//-----------------------------------------------------------------------------
	function new(string name = "aes_decrypt_sequencer", uvm_component parent = null);
		super.new (name, parent);
	endfunction : new

endclass : aes_decrypt_sequencer