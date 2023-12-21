// Shif Row Function
//
module func_test;

function [127:0] InvShiftRow;
	input 	[127:0] before_inv_shift_row;
	output 	[127:0] after_inv_shift_row;
	
	after_inv_shift_row [127:120] = before_inv_shift_row [127:120];	
	after_inv_shift_row [119:112] = before_inv_shift_row [23:16];		
	after_inv_shift_row [111:104] = before_inv_shift_row [47:40];				
	after_inv_shift_row [103:96]  = before_inv_shift_row [71:64];					
	after_inv_shift_row [95:88]   = before_inv_shift_row [95:88];		
	after_inv_shift_row [87:80]   = before_inv_shift_row [119:112]; 				
	after_inv_shift_row [79:72]   = before_inv_shift_row [15:8];					
	after_inv_shift_row [71:64]   = before_inv_shift_row [39:32]; 			
	after_inv_shift_row [63:56]   = before_inv_shift_row [63:56]; 	
	after_inv_shift_row [55:48]   = before_inv_shift_row [87:80];			
	after_inv_shift_row [47:40]   = before_inv_shift_row [111:104];				
	after_inv_shift_row [39:32]   = before_inv_shift_row [7:0];					
	after_inv_shift_row [31:24]   = before_inv_shift_row [31:24];		
	after_inv_shift_row [23:16]   = before_inv_shift_row [55:48]; 				
	after_inv_shift_row [15:8]    = before_inv_shift_row [79:72];						
	after_inv_shift_row [7:0]     = before_inv_shift_row [103:96];						

	return after_inv_shift_row;

endfunction: InvShiftRow


	logic [127:0] in;
	logic [127:0] out;

	logic [127:0] s = InvShiftRow(in, out);

	initial begin
		in = 128'h7ad5fda789ef4e272bca100b3d9ff59f;
		$display("output = 0x%0h", s);
	end 

endmodule


