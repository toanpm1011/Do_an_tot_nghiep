interface aes_intf(
    input clk, reset_n
);
    logic             en;
    // Encrypt interface 
    // input 
    logic     [127:0] plain_text_in;
    logic     [127:0] cipher_key_in;
    logic             cipher_new_en;
    //output
    logic    [127:0] cipher_text_out;
    logic            cipher_ready;
    logic    [127:0] round_key_10_out;

    // Decrypt interface
    // input
    logic     [127:0] cipher_text_in;
    logic     [127:0] round_key_10; 
    logic             decipher_new_en;
    // output
    logic    [127:0] plain_text_out;
    logic            decipher_ready;
    
endinterface : aes_intf