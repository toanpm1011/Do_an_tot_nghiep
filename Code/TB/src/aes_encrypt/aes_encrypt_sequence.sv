class aes_encrypt_sequence extends uvm_sequence#(aes_encrypt_transaction);
	`uvm_object_utils(aes_sequence)

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
		`uvm_do_with (item, {cipher_new_en == 1; plain_text == 128'h00112233445566778899aabbccddeeff; EN=1;})
		`uvm_do_with (item, {cipher_new_en == 1; plain_text == 128'h00112233445566778899aabbccddeeff; EN=1;})
		`uvm_do_with (item, {cipher_new_en == 1; plain_text == 128'h00112233445566778899aabbccddeeff; EN=1;})
  endtask : body

endclass : dti_uart_tx_sequence