`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/19/2023 01:36:25 PM
// Design Name: 
// Module Name: FSM_as_counter_TB
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


module FSM_as_counter_TB(

    );
    reg clk,reset,en;
    wire [2:0]num;
    
    FSM_as_counter uut(
    .clk(clk),
    .reset(reset),
    .en(en),
    .num(num)
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
        reset = 1'b0;
        en = 1'b0;
        @(negedge clk);
        reset = 1'b1;
        en=1'b1;
        
        repeat(20)@(negedge clk);
        $finish;
        end
        
endmodule
