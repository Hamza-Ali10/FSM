`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Hamza Ali
// 
// Create Date: 08/25/2023 03:16:41 PM
// Design Name: 
// Module Name: swap_reg_file
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module swap_reg_file#(parameter ADDR_WIDTH /*N*/ = 7 ,DATA_WIDTH/*Bits*/ = 8)(
    input clk,reset,
    input we,
    input [ADDR_WIDTH -1: 0]address_w , address_r,
    input [ADDR_WIDTH -1: 0] data_w,
    output [DATA_WIDTH-1 : 0] data_r,
    //input for swap functionaltiy
     input [ADDR_WIDTH -1: 0]address_A , address_B,
     input swap
    );
    
   wire [DATA_WIDTH - 1:0] MUX_READ_F , MUX_WIRTE_F;
   wire w;
   wire [1:0]sel;
   
   
   reg_file #(.ADDR_WIDTH(ADDR_WIDTH) ,.DATA_WIDTH(ADDR_WIDTH)) REG_FILE(
   .clk(clk),
   .we(w?1'b1:we),
   .address_w(MUX_WIRTE_F),
   .address_r(MUX_READ_F),
   .data_w(w ? data_r : data_w),
   .data_r(data_r)
   );
   
   swap_FSM FSM0(
   .clk(clk),
   .reset(reset),
   .swap(swap),
   .w(w),
   .sel(sel)
   );
   
   Max_4_1_nBIT #(.n(ADDR_WIDTH)) MUX_READ(
   .w0(address_r ),
   .w1(address_A ),
   .w2(address_B ),
   .w3('b0),
   .s(sel),
   .f(MUX_READ_F)
   );
   
   Max_4_1_nBIT #(.n(ADDR_WIDTH)) MUX_WIRTE(
   .w0(address_w ),
   .w1('b0 ),
   .w2(address_A ),
   .w3(address_B ),
   .s(sel),
   .f(MUX_WIRTE_F)
      );
   

endmodule