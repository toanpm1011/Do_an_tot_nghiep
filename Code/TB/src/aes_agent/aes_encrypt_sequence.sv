class aes_encrypt_sequence extends uvm_sequence#(aes_encrypt_transaction);
	`uvm_object_utils(aes_encrypt_sequence)

	aes_encrypt_transaction item;
//-----------------------------------------------------------------------------
// function : new
//-----------------------------------------------------------------------------
	function new(string name = "aes_encrypt_sequence");
		super.new(name);
	endfunction : new
//-----------------------------------------------------------------------------
// task: body
// Randomize data_in, send to TX_DUT
//-----------------------------------------------------------------------------
	task body();
		item = aes_encrypt_transaction::type_id::create("item");
		`uvm_do_with (item, {item.cipher_new_en == 1;  item.en==1;} ) 
		`uvm_do_with (item, {item.cipher_new_en == 1;  item.en==1;} ) 
		`uvm_do_with (item, {item.cipher_new_en == 1;  item.en==1;} ) 
  endtask : body

endclass : aes_encrypt_sequence