interface aes_intf(
    input clk,
    input reset_n
);
    logic     [127:0] plain_text_in,
    logic     [127:0] cipher_key_in,
    logic             cipher_new_en,
    logic     [127:0] cipher_text_in,
    logic     [127:0] round_key_10, 
    logic             EN,

    logic    [127:0] cipher_text_out,
    logic    [127:0] plain_text_out,
    logic            cipher_ready,
    logic            decipher_ready
    
endinterface : aes_intf