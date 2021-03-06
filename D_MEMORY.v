`timescale 1ns / 1ps
`include "DEFINE_CPU.v"

`ifndef D_MEMORY_V
`define D_MEMORY_V

module D_MEMORY(
    input clk,
    input rst_n,
    input [8:0] addr,
    input d_we,
    input [15:0] datain,
    output [15:0] dataout
    );

    reg [15:0] D_RAM[511:0];
    
    assign dataout = D_RAM[addr];
    always @(posedge clk or negedge rst_n)
        begin
            if (!rst_n)
                begin
                    // The initialization is moved to the top-level test bench
                    // D_RAM[0] <= 16'h00AB;
                    // D_RAM[1] <= 16'h3C00;
                    // D_RAM[2] <= 16'h0000;
                end
            else if (d_we)
                D_RAM[addr] <= datain;
        end

endmodule
`endif//D_MEMORY_V