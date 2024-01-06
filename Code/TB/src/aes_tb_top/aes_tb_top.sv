`include "include.svh"

`timescale 1ns/1ns

module aes_tb_top;
  logic clk;
  logic reset_n;
  initial begin
    clk = 1;
    reset_n = 0;
    #7;
    reset_n = 1;
  end

  always #10 clk = ~clk;

  aes_intf vif( 
    .clk(clk), 
    .reset_n(reset_n)
    );

  AES_top DUT (
        .clk      (vif.clk),
        .reset_n  (vif.reset_n),
        .plain_text_in (vif.plain_text_in),
        .cipher_key_in (vif.cipher_key_in),
        .cipher_new_en (vif.cipher_new_en),
        .cipher_text_in (vif.cipher_text_in),
        .round_key_10 (vif.round_key_10),
        .en               (vif.en),
        .decipher_new_en (vif.decipher_new_en),

        .round_key_10_out (vif.round_key_10_out),
        .cipher_text_out (vif.cipher_text_out),
        .plain_text_out (vif.plain_text_out),
        .cipher_ready (vif.cipher_ready),
        .decipher_ready (vif.decipher_ready)
        );

  initial begin
    uvm_config_db #(virtual aes_intf)::set(null,"*","vif",vif);
		run_test("aes_test");
  end

endmodule