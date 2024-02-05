`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Hamza Ali
// 
// Create Date: 08/19/2023 12:12:59 PM
// Design Name: 
// Module Name: mealy_101_detector
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


module mealy_101_detector(
    input clk,
    input reset,
    input x,
    output y
    );
    
    reg [1:0] state_reg ,state_next;
    localparam s0=0;
    localparam s1=1;
    localparam s2=2;
    //state register
    
    always @(posedge clk , negedge reset)
    begin
            if(~reset)
            state_reg <= s0;
            
            else
            state_reg <= state_next;
    
    end
    //next state 
    always@(*)
    begin
            case(state_next)
                        
                        s0: if(x)
                             state_next = s1;
                            else   
                            state_next = s0; 
                        s1: if(x)
                            state_next = s1;
                            else   
                            state_next = s2;    
                        s2:if(x)
                           state_next = s1;
                           else   
                           state_next = s0;
                   default: state_next = state_reg;          
            endcase
    end
    //output
    assign y = ( state_reg == s2 ) & x;
    
endmodule
