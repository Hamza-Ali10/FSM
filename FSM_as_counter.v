`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Hamza Ali
// 
// Create Date: 08/19/2023 01:30:49 PM
// Design Name: 
// Module Name: FSM_as_counter
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


module FSM_as_counter(
   input clk,
   input reset,
   input en,
   output [2:0] num
   );
   
   reg [2:0] state_reg ,state_next;
   localparam s0=0;
   localparam s1=1;
   localparam s2=2;
   localparam s3=3,s4=4,s5=5,s6=6,s7=7;
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
        if(en)
                  case(state_next)
                       s0: state_next = s1;
                       s1: state_next = s2;
                       s2: state_next = s3;
                       s3: state_next = s4;
                       s4: state_next = s5;
                       s5: state_next = s6;
                       s6: state_next = s7;
                       s7: state_next = s0;      
                  default: state_next = state_reg;          
               endcase
         else
           state_next = state_reg;
   end
   //output
   assign num=  state_reg ;
   
endmodule
