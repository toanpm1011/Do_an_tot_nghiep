// Shif Row Function
//
module func_test;

function [127:0] ShiftRow;
	input 	[127:0] before_shift_row;
	output 	[127:0] after_shift_row;
	
	after_shift_row [127:120] = before_shift_row [127:120];	
	after_shift_row [119:112] = before_shift_row [87:80];		
	after_shift_row [111:104] = before_shift_row [47:40];						
	after_shift_row [103:96] 	= before_shift_row [7:0];						
	after_shift_row [95:88] 	= before_shift_row [95:88];		
	after_shift_row [87:80] 	= before_shift_row [55:48]; 						
	after_shift_row [79:72] 	= before_shift_row [15:8];						
	after_shift_row [71:64] 	= before_shift_row [103:96]; 						
	after_shift_row [63:56] 	= before_shift_row [63:56]; 		
	after_shift_row [55:48] 	= before_shift_row [23:16];						
	after_shift_row [47:40]		= before_shift_row [111:104];						
	after_shift_row [39:32]		= before_shift_row [71:64];						
	after_shift_row [31:24]		= before_shift_row [31:24];		
	after_shift_row [23:16]		= before_shift_row [119:112]; 						
	after_shift_row [15:8]		= before_shift_row [79:72];						
	after_shift_row [7:0]			= before_shift_row [39:32];						
	return after_shift_row;

endfunction: ShiftRow


	logic [127:0] in;
	logic [127:0] out;

	logic [127:0] s = ShiftRow(in, out);

	initial begin
		in = 128'hd42711aee0bf98f1b8b45de51e415230;
		$display("output = 0x%0h", s);
	end 

endmodule