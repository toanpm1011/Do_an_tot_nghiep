// Shif Row Function
//
function [127:0] InvShiftRow;
	input 	[127:0] before_inv_shift_row;
	
	InvShiftRow [127:120] = before_inv_shift_row [127:120];	
	InvShiftRow [119:112] = before_inv_shift_row [23:16];		
	InvShiftRow [111:104] = before_inv_shift_row [47:40];					
	InvShiftRow [103:96] 	= before_inv_shift_row [71:64];					
	InvShiftRow [95:88] 	= before_inv_shift_row [95:88];		
	InvShiftRow [87:80] 	= before_inv_shift_row [119:112]; 				
	InvShiftRow [79:72] 	= before_inv_shift_row [15:8];				
	InvShiftRow [71:64] 	= before_inv_shift_row [39:32]; 				
	InvShiftRow [63:56] 	= before_inv_shift_row [63:56]; 		
	InvShiftRow [55:48] 	= before_inv_shift_row [87:80];					
	InvShiftRow [47:40]		= before_inv_shift_row [111:104];				
	InvShiftRow [39:32]		= before_inv_shift_row [7:0];					
	InvShiftRow [31:24]		= before_inv_shift_row [31:24];	
	InvShiftRow [23:16]		= before_inv_shift_row [55:48]; 				
	InvShiftRow [15:8]		= before_inv_shift_row [79:72];					
	InvShiftRow [7:0]			= before_inv_shift_row [103:96];						

endfunction: InvShiftRow