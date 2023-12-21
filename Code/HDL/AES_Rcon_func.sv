/* Ham xac dinh gia tri rcon */
function logic [31:0] Rcon;
    input [3:0] round_num; /* gia tri round dau vao */
    case (round_num)
        4'd0: Rcon = 32'h0100_0000;
        4'd1: Rcon = 32'h0200_0000;
        4'd2: Rcon = 32'h0400_0000;
        4'd3: Rcon = 32'h0800_0000;
        4'd4: Rcon = 32'h1000_0000;
        4'd5: Rcon = 32'h2000_0000;
        4'd6: Rcon = 32'h4000_0000;
        4'd7: Rcon = 32'h8000_0000;
        4'd8: Rcon = 32'h1B00_0000;
        4'd9: Rcon = 32'h3600_0000;
        default: Rcon = 32'h0100_0000;
    endcase
endfunction

function logic [31:0] Rcon_Inv;
  input [3:0] round_num;
    case (round_num)
        4'd9:   Rcon_Inv = 32'h0100_0000;
        4'd8:   Rcon_Inv = 32'h0200_0000;
        4'd7:   Rcon_Inv = 32'h0400_0000;
        4'd6:   Rcon_Inv = 32'h0800_0000;
        4'd5:   Rcon_Inv = 32'h1000_0000;
        4'd4:   Rcon_Inv = 32'h2000_0000;
        4'd3:   Rcon_Inv = 32'h4000_0000;
        4'd2:   Rcon_Inv = 32'h8000_0000;
        4'd1:   Rcon_Inv = 32'h1B00_0000;
        4'd0:   Rcon_Inv = 32'h3600_0000;
        default: Rcon_Inv = 32'h0100_0000;
    endcase
endfunction