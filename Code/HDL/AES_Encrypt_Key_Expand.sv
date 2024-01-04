//  Module: AES_Encrypt_Key_Expand
//  

`include "AES_S_box.sv"
`include "AES_Rcon_func.sv"

module AES_Encrypt_Key_Expand
    (   // Port Declarations
    // Input Port
        input                   clk,            // Tin hieu xung clock
        input                   reset_n,        // Tin hieu reset, tich cuc muc thap
        input   logic [127:0]   cipher_key,     // Cipher key dau vao
        input   logic           cipher_new_en,  // Co cho phep cipher text san sang
        input   logic           round_key_en,   // Co bao nhieu khoa vong moi da san sang
        input   logic [3:0]     round_num,      // So vong lap hien tai
        input                   en,
    // Output Port
        output  logic [127:0]   round_key_out   // Khoa vong dau ra
    );

    // Internal Signal Declarations
    logic   [127:0] round_key;
    logic   [127:0] round_key_reg;
    logic   [31:0]  rcon;
    logic   [31:0]  after_rot_word;
    logic   [31:0]  after_sub_word;
    logic   [31:0]  after_add_rcon;
    logic   [127:0] round_key_in;
    
    // Thanh ghi round_key_out
always_ff @(posedge clk or negedge reset_n)
begin
    if (!reset_n)
        round_key_reg <= 0;
    else 
        round_key_reg <= (cipher_new_en | round_key_en) ? round_key : round_key_out;
end

assign round_key_out[127:0] = round_key_reg[127:0];

    // Round_key_in
     assign round_key_in = (~|round_num) ? cipher_key : round_key_reg;


    // Rot Word
assign after_rot_word = {round_key_in [23:0], round_key_in [31:24]};

    // Sub Word
assign after_sub_word [31:24] = aes128_sbox1(after_rot_word [31:24], en);
assign after_sub_word [23:16] = aes128_sbox1(after_rot_word [23:16], en);
assign after_sub_word [15:8]  = aes128_sbox1(after_rot_word [15:8], en);
assign after_sub_word [7:0]   = aes128_sbox1(after_rot_word [7:0], en);

    // Add Rcon
assign rcon = Rcon(round_num, en);
assign after_add_rcon = rcon ^ after_sub_word;

    // next_round_key
assign round_key [127:96] = after_add_rcon ^ round_key_in [127:96];
assign round_key [95:64] = round_key_in [95:64] ^ round_key [127:96];
assign round_key [63:32] = round_key_in [63:32] ^ round_key [95:64];
assign round_key [31:0] = round_key_in [31:0] ^ round_key [63:32];

endmodule: AES_Encrypt_Key_Expand
