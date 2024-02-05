`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Hamza Ali
// 
// Create Date: 08/19/2023 12:44:34 PM
// Design Name: 
// Module Name: x_101_detector_TB
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


module x_101_detector_TB(

    );
    
    reg clk,reset,x;
    wire y_moore , y_mealy;
    
    moore_101_detector uut1(
     .clk(clk),
      .reset(reset),
     .x(x),
     .y(y_moore)
       );
       
     mealy_101_detector uut2(
       .clk(clk),
       .reset(reset),
       .x(x),
       .y(y_mealy)
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
        x  = 1'b0;
        @(negedge clk);
        reset = 1'b1;
        
       x = 1'b0;
    #T x = 1'b0;
    #T x = 1'b1;
    #T x = 1'b1;
    #T x = 1'b0;
    #T x = 1'b1;
    #T x = 1'b1;
    #T x = 1'b0;
    #T x = 1'b0;
    #T x = 1'b1;
    #T x = 1'b0;
    #2 x = 1'b1;
    #T x = 1'b0;
    #T x = 1'b1;
    #T x = 1'b0;
    #T x = 1'b0;
    #T $finish;
    
    end
endmodule
