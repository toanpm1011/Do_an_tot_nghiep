// Shif Row Function
//
function [127:0] ShiftRow;
	input 	[127:0] before_shift_row;
	input   EN;

	if (EN) begin 
		ShiftRow [127:120] = before_shift_row [127:120];	
		ShiftRow [119:112] = before_shift_row [87:80];		
		ShiftRow [111:104] = before_shift_row [47:40];						
		ShiftRow [103:96] 	= before_shift_row [7:0];						
		ShiftRow [95:88] 	= before_shift_row [95:88];		
		ShiftRow [87:80] 	= before_shift_row [55:48]; 						
		ShiftRow [79:72] 	= before_shift_row [15:8];						
		ShiftRow [71:64] 	= before_shift_row [103:96]; 						
		ShiftRow [63:56] 	= before_shift_row [63:56]; 		
		ShiftRow [55:48] 	= before_shift_row [23:16];						
		ShiftRow [47:40]		= before_shift_row [111:104];						
		ShiftRow [39:32]		= before_shift_row [71:64];						
		ShiftRow [31:24]		= before_shift_row [31:24];		
		ShiftRow [23:16]		= before_shift_row [119:112]; 						
		ShiftRow [15:8]		= before_shift_row [79:72];						
		ShiftRow [7:0]			= before_shift_row [39:32];		
	end 
	else begin 
		ShiftRow [127:120] = before_shift_row [127:120];	
		ShiftRow [119:112] = before_shift_row [23:16];		
		ShiftRow [111:104] = before_shift_row [47:40];					
		ShiftRow [103:96] 	= before_shift_row [71:64];					
		ShiftRow [95:88] 	= before_shift_row [95:88];		
		ShiftRow [87:80] 	= before_shift_row [119:112]; 				
		ShiftRow [79:72] 	= before_shift_row [15:8];				
		ShiftRow [71:64] 	= before_shift_row [39:32]; 				
		ShiftRow [63:56] 	= before_shift_row [63:56]; 		
		ShiftRow [55:48] 	= before_shift_row [87:80];					
		ShiftRow [47:40]		= before_shift_row [111:104];				
		ShiftRow [39:32]		= before_shift_row [7:0];					
		ShiftRow [31:24]		= before_shift_row [31:24];	
		ShiftRow [23:16]		= before_shift_row [55:48]; 				
		ShiftRow [15:8]		= before_shift_row [79:72];					
		ShiftRow [7:0]			= before_shift_row [103:96];
		
	end 

endfunction: ShiftRow
