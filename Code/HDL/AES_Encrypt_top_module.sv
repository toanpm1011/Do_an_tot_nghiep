//  Module: AES_Encrypt_top_module
//

`include "AES_Mul_func.sv"
`include "AES_S_box.sv"
`include "AES_Encrypt_ShiftRow_func.sv"
`include "AES_Rcon_func.sv"

module AES_Encrypt_top_module
    (// Ports Declaration
        //  Input Ports
        input                   clk,
        input                   reset_n,
        input   logic   [127:0] plain_text,
        input   logic   [127:0] cipher_key,
        input   logic           cipher_new_en,
        input                   EN,
        // Output Ports
        output  logic           cipher_ready,
        output  logic   [127:0] cipher_text
    );

    logic [3:0] round_num;
    logic round_key_en;
    logic [127:0] round_key;

    AES_Encrypt_Key_Expand  D1 (
        .clk            (clk),
        .reset_n        (reset_n),
        .cipher_key     (cipher_key),
        .cipher_new_en  (cipher_new_en),
        .round_key_en   (round_key_en),
        .round_num      (round_num),
        .round_key_out  (round_key),
        .EN                 (EN)
    );

    AES_Encrypt_Core    D2  (
        .clk            (clk),
        .reset_n        (reset_n),
        .plain_text     (plain_text),
        .cipher_key     (cipher_key),
        .round_key      (round_key),
        .cipher_new_en  (cipher_new_en),
        .round_key_en   (round_key_en),
        .cipher_ready  (cipher_ready),
        .round_num      (round_num),
        .cipher_text    (cipher_text),
        .EN                 (EN)
    );
    
endmodule: AES_Encrypt_top_module

