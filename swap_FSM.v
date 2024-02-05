`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Hamza Ali
// 
// Create Date: 08/25/2023 03:07:04 PM
// Design Name: 
// Module Name: swap_FSM
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


module swap_FSM(
  input clk,
  input reset,swap,
  output w,
  output [1:0] sel
  );
  
  reg [1:0] state_reg ,state_next;
  parameter s0=0;
  parameter s1=1;
  parameter s2=2;
  parameter s3=3;
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
           state_next = state_reg;
                 case(state_next)
                      s0: if(~swap)
                            state_next = s0;
                            else
                            state_next = s1;                       
                      s1: state_next = s2;
                      s2: state_next = s3;
                      s3: state_next = s0;     
                 default: state_next = s0;          
              endcase
  end
  
  //output
  assign sel=  state_reg ;
  assign w = { state_reg != s0};
  
endmodule

