class aes_decrypt_sequence extends uvm_sequence#(aes_decrypt_transaction);
	`uvm_object_utils(aes_sequence)

	aes_decrypt_transaction item;
//-----------------------------------------------------------------------------
// function : new
//-----------------------------------------------------------------------------
	function new(string name = "aes_sequence");
		super.new(name);
	endfunction : new
//-----------------------------------------------------------------------------
// task: body
// Randomize data_in, send to TX_DUT
//-----------------------------------------------------------------------------
	task body();
		item = aes_decrypt_transaction::type_id::create("item");
		`uvm_do_with (item, {EN=0; decipher_new_en =1;})
		`uvm_do_with (item, {EN=0; decipher_new_en =1;})
		// `uvm_do_with (item, {send_req == 1; din == 8'b00111010;}) 
		// `uvm_do_with (item, {send_req == 1; din == 8'b11110000;})
  endtask : body

endclass : aes_decrypt_sequence