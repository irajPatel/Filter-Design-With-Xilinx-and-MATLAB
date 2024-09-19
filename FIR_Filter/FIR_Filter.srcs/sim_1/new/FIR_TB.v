`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2021 02:50:34 PM
// Design Name: 
// Module Name: FIR_TB
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


module FIR_TB; 

parameter N = 16;

reg clk, reset;
reg [N-1:0] data_in;
wire  [N-1:0] data_out; 
FIR_Filters inst0(clk,reset,data_in,data_out);
//input sine wave
initial 
$readmemb("signal.data",RAMM);
//Creating RAM
reg [N-1:0]RAMM[31:0];

//creating clock
initial
clk=0;
always
#10 clk=~clk;

//apply RAMM data to design inst0

always@(posedge clk)
   data_in <=RAMM[Address];


//Address Counter 
reg [4:0] Address; 
initial
Address = 1; 
always@(posedge clk)
begin
    if (Address == 31)
        Address = 0; 
    else
        Address = Address + 1; 
end     

    
  

endmodule 
