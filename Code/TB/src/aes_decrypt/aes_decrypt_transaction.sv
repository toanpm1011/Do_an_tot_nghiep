class aes_decrypt_transaction extends uvm_sequence_item;
	// random data to send to AES DUT
	rand logic          decipher_new_en;
	rand logic 			en;
	     logic          cipher_ready;
		 logic          decipher_ready;
		 logic [127:0]	plain_text_out;


	// UVM Utils Macros
	`uvm_object_utils_begin(aes_decrypt_transaction)
		`uvm_field_int(en, UVM_ALL_ON)
		`uvm_field_int(decipher_new_en, UVM_ALL_ON)
	`uvm_object_utils_end 

	function new (string name = "aes_decrypt_transaction");
		super.new (name);
	endfunction : new


endclass : aes_decrypt_transaction