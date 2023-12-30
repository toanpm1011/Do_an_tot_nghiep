`include "AES_S_box.sv"
`include "AES_Encrypt_ShiftRow_func.sv"
`include "AES_Rcon_func.sv"
`include "AES_Mul_func.sv"

module test_func;
    //input
    reg clk;
    reg reset_n;
    reg [127:0] cipher_key;
    reg [127:0] plain_text;
    reg cipher_new_en;
    //output
    wire [127:0] cipher_text;
    wire         cipher_ready;
    reg EN;
    //
    AES_Encrypt_top_module dut
    (   .clk(clk),
        .reset_n(reset_n),
        .plain_text(plain_text),
        .cipher_key(cipher_key),
        .cipher_new_en(cipher_new_en),
        .EN(EN),
    //output
        .cipher_ready(cipher_ready),
        .cipher_text(cipher_text)
    );


    initial begin    clk = 0;
      reset_n = 0;
      cipher_key = 0;
      plain_text = 0;
      cipher_new_en = 0;
    end  
    
    initial begin    
        forever #5 clk = ~clk;
    end
    
    initial begin    #16
        reset_n = 1;
      #10
      cipher_new_en = 1;
      EN =1;
      plain_text = 128'h00112233445566778899aabbccddeeff;    cipher_key = 128'h000102030405060708090a0b0c0d0e0f; 
      #10
      cipher_new_en = 0;
      #120
      $display ("---- cipher_text: %32h - READY: %1b \n", cipher_text[127:0], cipher_ready);
      #10
      cipher_new_en = 1;
      EN =1;
      plain_text = 128'h00112233445566778899aabbccddeeff;    cipher_key = 128'ha5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5; 
      #10
      cipher_new_en = 0;
      #120
      $display ("---- cipher_text: %32h - READY: %1b\n", cipher_text[127:0], cipher_ready);
      $stop;
    end
  endmodule