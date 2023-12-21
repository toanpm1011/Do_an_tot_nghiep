`include "AES_S_box.sv"
`include "AES_Decrypt_ShiftRow_Inv_func.sv"
`include "AES_Rcon_func.sv"
`include "AES_Mul_func.sv"

module tb_cipher_inv_top;
  //input
  reg clk_sys;
  reg rst_n;
  reg	[127:0]	cipher_text;
  reg	[127:0]	round_key_10;
  reg decipher_en;
  //output
  wire [127:0] plain_text;
  wire         decipher_ready;
  //
  AES_Decrypt_top_module DUT (
  //input
  .clk(clk_sys),
  .reset_n(rst_n),
  .cipher_text(cipher_text),
  .round_key_10(round_key_10),
  .decipher_new_en(decipher_en),

  //output
  .decipher_ready(decipher_ready),
  .plain_text(plain_text)
  );
  
  initial begin
    clk_sys = 0;
    rst_n = 0;
    round_key_10 = 0;
    cipher_text = 0;
    decipher_en = 0;
  end
  initial begin
    forever #5 clk_sys = ~clk_sys;
  end
  initial begin    #16
    rst_n = 1;
  #10
  decipher_en = 1;
  cipher_text = 128'h69c4e0d86a7b0430d8cdb78070b4c55a;    round_key_10 = 128'h13111d7fe3944a17f307a78b4d2b30c5; 
  #10
  decipher_en = 0;
  #120
  $display ("---- cipher_text: %32h - READY: %1b\n", plain_text[127:0], decipher_ready);
  #10
  decipher_en = 1;
  cipher_text = 128'hdaba0685a6b6ef1d096f7980accf3ac5;    round_key_10 = 128'hfd92814d079f28dad0babe23ef7f; 
  #10
  decipher_en = 0;
  #120
  $display ("---- cipher_text: %32h - READY: %1b\n", plain_text[127:0], decipher_ready);
  $stop;
end

endmodule
