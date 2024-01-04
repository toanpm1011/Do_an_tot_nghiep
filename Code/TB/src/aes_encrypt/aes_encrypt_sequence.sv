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
		`uvm_do_with (item, {item.cipher_new_en == 1; item.plain_text_in == 128'h00112233445566778899aabbccddeeff; 
													item.cipher_key_in == 128'h000102030405060708090a0b0c0d0e0f; item.en==1;})
		// `uvm_do_with (item, {item.cipher_new_en == 1; item.plain_text_in == 128'h00112233445566778899aabbccddeeff; item.EN=1;})
		// `uvm_do_with (item, {item.cipher_new_en == 1; item.plain_text_in == 128'h00112233445566778899aabbccddeeff; item.EN=1;})
  endtask : body

endclass : aes_encrypt_sequence