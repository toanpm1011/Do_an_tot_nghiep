//  Module: AES_Encrypt_top_module
//

`include "AES_Mul_func.sv"
`include "AES_S_box.sv"
`include "AES_Decrypt_ShiftRow_Inv_func.sv"
`include "AES_Rcon_func.sv"

module AES_Decrypt_top_module
    (// Ports Declaration
        //  Input Ports
        input                   clk,
        input                   reset_n,
        input   logic   [127:0] cipher_text,
        input   logic   [127:0] round_key_10,
        input   logic           decipher_new_en,
        // Output Ports
        output  logic           decipher_ready,
        output  logic   [127:0] plain_text
    );

    logic [3:0] round_num;
    logic round_key_en;
    logic [127:0] round_key_out;

    AES_Decrypt_Key_Expand  D1 (
        .clk                (clk),
        .reset_n            (reset_n),
        .round_key_10       (round_key_10),
        .decipher_new_en    (decipher_new_en),
        .round_key_en       (round_key_en),
        .round_num          (round_num),
        .round_key_out      (round_key_out)
    );

    AES_Decrypt_Core    D2  (
        .clk                (clk),
        .reset_n            (reset_n),
        .cipher_text        (cipher_text),
        .round_key_10       (round_key_10),
        .round_key          (round_key_out),
        .decipher_new_en    (decipher_new_en),
        .round_key_en       (round_key_en),
        .decipher_ready     (decipher_ready),
        .round_num          (round_num),
        .plain_text         (plain_text)
    );
    
endmodule: AES_Decrypt_top_module

