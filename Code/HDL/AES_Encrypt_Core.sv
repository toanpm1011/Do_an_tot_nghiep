//  Module: AES_Encrypt_Core
//
`include "AES_Mul_func.sv"
`include "AES_S_box.sv"
`include "AES_Encrypt_ShiftRow_func.sv"


module AES_Encrypt_Core
    ( // Ports Declaration
    // Input Ports
        input                clk,
        input                reset_n,
        input  logic [127:0] plain_text,
        input  logic [127:0] cipher_key,
        input  logic [127:0] round_key,
        input  logic         cipher_new_en,
        input  logic         en,
        
    // Output Ports
        output logic         round_key_en,
        output logic         cipher_ready,
        output logic [3:0]   round_num,
        output logic [127:0] cipher_text
    );
// Internal Signal Declaration
    logic cipher_finish;
    logic [3:0] cipher_counter;
    logic [127:0]   after_add_roundkey;
    logic [127:0]   after_sub_bytes;
    logic [127:0]   after_shiftRows;
    logic [127:0]   after_mix_column;
    logic [127:0]   cipher_text_reg;
    logic [127:0]   subbytes_sel;
    logic [127:0]   mixColumns_in;
    logic [127:0]   addRoundKey_in;

// Counter round number

// Thanh ghi dem so vong ma hoa hien tai
always_ff @(posedge clk or negedge reset_n)
begin
    if (~reset_n) begin
        cipher_counter <= 0;
    end 
    else if (cipher_finish) begin
        cipher_counter <= 0;
    end 
    else if (cipher_new_en | round_key_en) begin
        cipher_counter <=  cipher_counter + 1'b1;
    end 
end

// Thanh ghi bao hieu ket thuc qua trinh ma hoa 
always_ff @( posedge clk or negedge reset_n ) begin 
    if (~reset_n)
        cipher_ready <= 1;
    else  
        cipher_ready <= (cipher_new_en) ? (0) : ((cipher_finish) ? (1) : cipher_ready);
end

// Thanh ghi cipher_text
always_ff @(posedge clk or negedge reset_n) begin
    if (~reset_n)
        cipher_text_reg <= 0;
    else begin
        if (cipher_new_en | round_key_en) 
            cipher_text_reg <= after_add_roundkey;
        else cipher_text_reg <= cipher_text_reg;
    end
end

//--------------------

assign after_add_roundkey = ((cipher_new_en) ? cipher_key : round_key) ^ ((cipher_new_en) ? plain_text : ((cipher_finish) ? after_shiftRows : after_mix_column));

assign round_key_en = ~cipher_ready;

assign round_num = cipher_counter;


assign cipher_finish = (cipher_counter == 4'b1010) ? 1'b1 : 1'b0;

assign	cipher_text	= cipher_text_reg;
    
// Sub Bytes

assign after_sub_bytes = S_box(cipher_text_reg, en);
// Shift Row

assign after_shiftRows = ShiftRow(after_sub_bytes, en);

// MixColumn

assign after_mix_column = MixColumn(after_shiftRows, en);

endmodule: AES_Encrypt_Core
