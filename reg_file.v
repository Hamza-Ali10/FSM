`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Hamza Ali
// 
// Create Date: 08/25/2023 02:48:22 PM
// Design Name: 
// Module Name: reg_file
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


module reg_file #(parameter ADDR_WIDTH /*N*/ = 7 ,DATA_WIDTH/*Bits*/ = 8)(
    input clk,
    input we,
    input [ADDR_WIDTH -1: 0]address_w , address_r,
    input [ADDR_WIDTH -1: 0] data_w,
    output [DATA_WIDTH-1 : 0] data_r
    );
    
    reg [DATA_WIDTH - 1:0] memory[0:2**ADDR_WIDTH -1];
    
    always@(posedge clk)
    begin
            //synchronous wirte port
            if(we)
            memory[address_w] <=  data_w;
    end
    
    //Asynchronous read port
    assign data_r = memory[address_r];
    
endmodule
