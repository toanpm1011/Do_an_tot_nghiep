// Multiplication in GF(2^8)

function logic [7:0] mul2;
  input [7:0] mul2_in;
  mul2 = (mul2_in[7] == 1'b1) ? ({mul2_in[6:0], 1'b0} ^ 8'b0001_1011) : {mul2_in[6:0], 1'b0};
endfunction

function logic [7:0] mul3;
  input [7:0] mul3_in;
  mul3[7:0] = mul2(mul3_in[7:0]) ^ mul3_in[7:0];
endfunction

function  [7:0] mul_09;
    input [7:0] in;
    begin
    mul_09 = in ^ mul2(mul2(mul2(in)));
    end
endfunction

function  [7:0] mul_0b;
    input [7:0] in;
    begin
    mul_0b = (in ^ mul2(in)) ^ mul2(mul2(mul2(in)));
    end
endfunction

function  [7:0] mul_0d;
    input [7:0] in;
    begin
    mul_0d = (in ^ mul2(mul2(in))) ^ mul2(mul2(mul2(in)));
    end
endfunction

function  [7:0] mul_0e;
    input [7:0] in;
    begin
    mul_0e = (mul2(in) ^ mul2(mul2(in))) ^ mul2(mul2(mul2(in)));
    end
endfunction

function logic [31:0] Mul_MixColumn;
	input [31:0] before_mix_column;

	Mul_MixColumn [31:24] = ((mul2(before_mix_column [31:24]) ^ mul3(before_mix_column [23:16])) ^ before_mix_column [15:8])       ^ before_mix_column [7:0];
	Mul_MixColumn [23:16] = ((before_mix_column [31:24]       ^ mul2(before_mix_column [23:16])) ^ mul3(before_mix_column [15:8])) ^ before_mix_column [7:0];
	Mul_MixColumn [15:8]  = ((before_mix_column [31:24]       ^ before_mix_column [23:16])       ^ mul2(before_mix_column [15:8])) ^ mul3(before_mix_column [7:0]);
	Mul_MixColumn [7:0]   = ((mul3(before_mix_column [31:24]) ^ before_mix_column [23:16])       ^ before_mix_column [15:8])       ^ mul2(before_mix_column [7:0]);

endfunction : Mul_MixColumn

function logic [127:0] MixColumn;
	input [127:0] state_in;

	MixColumn [127:96] = Mul_MixColumn(state_in[127:96]);
	MixColumn [95:64]  = Mul_MixColumn(state_in[95:64]);
	MixColumn [63:32]  = Mul_MixColumn(state_in[63:32]);
	MixColumn [31:0]   = Mul_MixColumn(state_in[31:0]);

endfunction

function [31:0] Mul_InvMixColumn;
	input 	[31:0] before_inv_mix_column;

	Mul_InvMixColumn [31:24] = mul_0e(before_inv_mix_column [31:24]) ^ mul_0b(before_inv_mix_column [23:16]) ^ mul_0d(before_inv_mix_column [15:8]) ^ mul_09(before_inv_mix_column [7:0]);
	Mul_InvMixColumn [23:16] = mul_09(before_inv_mix_column [31:24]) ^ mul_0e(before_inv_mix_column [23:16]) ^ mul_0b(before_inv_mix_column [15:8]) ^ mul_0d(before_inv_mix_column [7:0]);
	Mul_InvMixColumn [15:8]  = mul_0d(before_inv_mix_column [31:24]) ^ mul_09(before_inv_mix_column [23:16]) ^ mul_0e(before_inv_mix_column [15:8]) ^ mul_0b(before_inv_mix_column [7:0]);
	Mul_InvMixColumn [7:0]   = mul_0b(before_inv_mix_column [31:24]) ^ mul_0d(before_inv_mix_column [23:16]) ^ mul_09(before_inv_mix_column [15:8]) ^ mul_0e(before_inv_mix_column [7:0]);

endfunction : Mul_InvMixColumn

function logic [127:0] InvMixColumn;
	input [127:0] state_in;

	InvMixColumn [127:96] = Mul_InvMixColumn(state_in[127:96]);
	InvMixColumn [95:64]  = Mul_InvMixColumn(state_in[95:64]);
	InvMixColumn [63:32]  = Mul_InvMixColumn(state_in[63:32]);
	InvMixColumn [31:0]   = Mul_InvMixColumn(state_in[31:0]);

endfunction