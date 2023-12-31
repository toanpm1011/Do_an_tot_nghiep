class aes_encrypt_transaction extends uvm_sequence_item;
	// random data to send to AES DUT
	rand logic 					en;
	// encrypt
	rand logic [127:0]  plain_text_in;
  rand logic [127:0]  cipher_key_in;
	rand logic          cipher_new_en;

		   logic          cipher_ready;
		 	 logic [127:0]	cipher_text_out;
		 	 logic [127:0]	round_key_10_out;

	//decrypt
	rand logic [127:0]  cipher_text_in;
  rand logic [127:0]  round_key_10;
	rand logic          decipher_new_en;

		   logic          decipher_ready;
		 	 logic [127:0]	plain_text_out;

	// UVM Utils Macros
	`uvm_object_utils_begin(aes_encrypt_transaction)
		`uvm_field_int(plain_text_in, UVM_ALL_ON)
		`uvm_field_int(cipher_key_in, UVM_ALL_ON)
		`uvm_field_int(cipher_new_en, UVM_ALL_ON)
		`uvm_field_int(cipher_text_in, UVM_ALL_ON)
		`uvm_field_int(round_key_10, UVM_ALL_ON)
		`uvm_field_int(decipher_new_en, UVM_ALL_ON)
		`uvm_field_int(en, UVM_ALL_ON)
	`uvm_object_utils_end 

	function new (string name = "aes_encrypt_transaction");
		super.new (name);
	endfunction : new


endclass : aes_encrypt_transaction