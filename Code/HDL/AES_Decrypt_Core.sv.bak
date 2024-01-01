//  Module: AES_Encrypt_Core
//
`include "AES_Mul_func.sv"
`include "AES_S_box.sv"
`include "AES_Encrypt_ShiftRow_func.sv"


module AES_Decrypt_Core
    ( // Ports Declaration
    // Input Ports
        input                clk,
        input                reset_n,
        input  logic [127:0] cipher_text,
        input  logic [127:0] round_key_10,
        input  logic [127:0] round_key,
        input  logic         decipher_new_en,
        input EN,
        
    // Output Ports
        output logic         round_key_en,
        output logic         decipher_ready,
        output logic [3:0]   round_num,
        output logic [127:0] plain_text
    );
// Internal Signal Declaration
    logic decipher_finish;
    logic [3:0] decipher_counter;
    logic [127:0]   after_add_roundkey;
    logic [127:0]   after_sub_bytes;
    logic [127:0]   after_shiftRows;
    logic [127:0]   after_mix_column;
    logic [127:0]   plain_text_reg;
    logic [127:0]   addRoundKey_in;

// Counter round number

// Thanh ghi dem so vong ma hoa hien tai
always_ff @(posedge clk or negedge reset_n)
begin
    if (~reset_n) begin
        decipher_counter <= 0;
    end 
    else if (decipher_finish) begin
        decipher_counter <= 0;
    end 
    else if (decipher_new_en | round_key_en) begin
        decipher_counter <=  decipher_counter + 1'b1;
    end 
end

// Thanh ghi bao hieu ket thuc qua trinh ma hoa 
always_ff @( posedge clk or negedge reset_n ) begin 
    if (~reset_n)
        decipher_ready <= 1;
    else  
        decipher_ready <= (decipher_new_en) ? (0) : ((decipher_finish) ? (1) : decipher_ready);
end

// Thanh ghi cipher_text
always_ff @(posedge clk or negedge reset_n) begin
    if (~reset_n)
        plain_text_reg <= 0;
    else begin
        if (decipher_new_en | round_key_en) 
            plain_text_reg <= after_add_roundkey;
    end
end

//--------------------

assign after_add_roundkey = ((decipher_new_en) ? round_key_10 : (decipher_finish ? (round_key) : (MixColumn(round_key, EN)))) ^ 
                                ((decipher_new_en) ? cipher_text : ((decipher_finish) ? after_shiftRows : after_mix_column));

assign round_key_en = ~decipher_ready;

assign round_num = decipher_counter;

assign decipher_finish = (decipher_counter == 4'b1010) ? 1'b1 : 1'b0;

assign	plain_text	= plain_text_reg;
    
// Sub Bytes

assign after_sub_bytes = S_box(plain_text_reg, EN);
// Shift Row

assign after_shiftRows = ShiftRow(after_sub_bytes, EN);

// MixColumn

assign after_mix_column = MixColumn(after_shiftRows, EN);

endmodule: AES_Decrypt_Core