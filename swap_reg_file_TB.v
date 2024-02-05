`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Hamza Ali
// 
// Create Date: 08/25/2023 03:36:05 PM
// Design Name: 
// Module Name: swap_reg_file_TB
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


module swap_reg_file_TB(

    );
    
           localparam ADDR_WIDTH /*N*/ = 7 ,DATA_WIDTH/*Bits*/ = 8;
           reg clk,reset;
           reg we;
           reg [ADDR_WIDTH -1: 0]address_w , address_r;
           reg[ADDR_WIDTH -1: 0] data_w;
           wire [DATA_WIDTH-1 : 0] data_r;
           reg [ADDR_WIDTH -1: 0]address_A , address_B;
           reg swap;
           integer i;
         
            
   swap_reg_file #(.ADDR_WIDTH(ADDR_WIDTH) ,.DATA_WIDTH(ADDR_WIDTH)) uut(
        .clk(clk),
        .reset(reset),
        .we(we),
        .address_w (address_w),
        .address_r(address_r),
        .data_w(data_w),
        .data_r(data_r),
        .address_A(address_A),
        .address_B(address_B),
        .swap(swap)
        );
    
    
     localparam T=10;  
             
       always
       begin
           clk = 1'b0;
           #(T / 2);
           clk = 1'b1;
           #(T / 2);
       end
       
       initial
       begin
       
           //issue a quick reset for 2ns
           reset = 1'b0;
           #2
           reset = 1'b1;
          swap = 1'b1;
           
           //fill loctions 20 to 30 with some numbers
           for(i = 20 ; i < 30 ; i = i+1)
           begin
                @(negedge clk);
                address_w = i;
                data_w = i;
                we = 1'b1;
           end
           
           //swap 2 loctions several times
           
           @(negedge clk);
           address_A = 'd22;
           address_B = 'd28;
           swap = 1'b1;
           repeat(3)@(negedge clk);
           swap = 1'b1;
           
          #25 $stop;
          
           end
endmodule
