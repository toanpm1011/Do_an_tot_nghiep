module AES_top (
    input                   clk,
    input                   reset_n,
    input logic     [127:0] plain_text_in,
    input logic     [127:0] cipher_key_in,
    input logic             cipher_new_en,
    input logic     [127:0] cipher_text_in,
    input logic     [127:0] round_key_10, 
    input logic             EN,

    output logic    [127:0] cipher_text_out,
    output logic    [127:0] plain_text_out,
    output logic            cipher_ready,
    output logic            decipher_ready
);

    AES_Decrypt_top_module DUT1 (
        // input
        .clk                (clk_sys),
        .reset_n            (rst_n),
        .cipher_text        (cipher_text_in),
        .round_key_10       (round_key_10),
        .decipher_new_en    (decipher_en),
        .EN                 (EN),
    
        // output
        .decipher_ready     (decipher_ready),
        .plain_text         (plain_text_out)
    );

    AES_Encrypt_top_module dut
    (   .clk            (clk),
        .reset_n        (reset_n),
        .plain_text     (plain_text_in),
        .cipher_key     (cipher_key_in),
        .cipher_new_en  (cipher_new_en),
        .EN             (EN),

        .cipher_ready   (cipher_ready),
        .cipher_text    (cipher_text_out)
    );
    
endmodule