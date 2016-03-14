//+FHDR****************************************************************
// ECE department, TAMU
// --------------------------------------------------------------------
// FILE NAME    : SCPU_IO_CTRL_RA1512_TEST.v
// AUTHER       : Jiafan Wang
// DATE         : 03/13/2016
// VERSION      : 1.0
// PURPOSE      : RA1SH 512x8 SRAM and ctrl module tester
// --------------------------------------------------------------------
// ABSTRACT: ModelSim simulation time 6us given each time period 10ns
// --------------------------------------------------------------------
`timescale 1ns / 1ps
`include "../DEFINE_CPU.v"
`include "../SRAM_IO_CTRL.v"
`include "../RA1SHD_ibm512x8.v"
`include "../I_MEMORY_8bit.v"

module SRAM_IO_CTRL_RA1512_TOP;

   parameter    MEMORY_DATA_WIDTH   = 8,
                MEMORY_ADDR_WIDTH   = 9,
                REG_BITS_WIDTH = MEMORY_ADDR_WIDTH + MEMORY_DATA_WIDTH;

    // Inputs
    reg clk;
    reg enable;// enable signal for CTRL_SRAM
    reg rst_n;//no use here
    reg start;// enable signal for SERIAL_CPU_8bit
    
    // Wires
    // wire is_i_addr;
    // wire [7:0]  i_datain;
    // wire [7:0]  d_datain;
    // wire [7:0]  d_dataout;
    wire [7:0]  m_datain;

    wire [7:0]  m_dataout;
    wire [8:0]  m_addr;
    // wire [8:0]  i_addr;
    // wire [8:0]  d_addr;
    wire d_we;
    wire CEN;
    wire SO;
    wire RDY;
    
    integer i,j;
    reg  [15:0] tmpi_datain;
    reg  [REG_BITS_WIDTH-1:0]  tmpi_all;//addr+instruction
    reg  [8:0]  tmpi_adder;
    reg  SI;
    reg  LOAD_N;
   
    // Instantiate the Unit Under Test (UUT)
    SRAM_IO_CTRL cct (
        .CLK(clk),
        .BGN(enable),
        .SI(SI),
        .LOAD_N(LOAD_N),
        .CTRL(2'b00),
        .PI(m_dataout),
        .RDY(RDY),
        .D_WE(d_we),
        .CEN(CEN),
        .SO(SO),
        .A(m_addr),
        .PO(m_datain)
    );
    
    RA1SHD_ibm512x8   sram (
        .CLK(clk),
        .CEN(!CEN), 
        .A(m_addr),
        .WEN(!d_we),// need a seperate control signal; or instruction set will be overwritten when d_we=1
        .D(m_datain),//i_instruct
        .Q(m_dataout)
    );

    I_MEMORY_8BIT   i_mem(
        // .clk(clk),
        // .rst_n(CEN), 
        // .addr(m_addr),
        // .d_we(d_we),// need a seperate control signal; or instruction set will be overwritten when d_we=1
        // .datain(m_datain),//i_instruct
        // .dataout(m_dataout)
    );
    
    parameter   DEFAULT_PC_ADDR = 16;
    //defparam    uut.DEFAULT_PC_ADDR = DEFAULT_PC_ADDR;
    
    //assign  m_addr = (is_i_addr)?i_addr:d_addr;
    //assign  m_datain = d_dataout;
    //assign  i_datain = (is_i_addr)?m_dataout:0;
    //assign  d_datain = (is_i_addr)?0:m_dataout;
    
    initial begin
        // Initialize Inputs
        clk = 0;
        rst_n = 0;
        enable = 0;
        start = 0;
        LOAD_N = 1;

        // Wait 100 ns for global rst_n to finish
        #100;
        
        // Add stimulus here
        // $display("pc  :               id_ir                :reg_A :reg_B :reg_C\
            // : da  :  dd  : w :  gr1  :  gr2  :  gr3   :zf :nf:cf");
        // $monitor("%3d : %b : %h : %h : %h : %h : %h : %b : %h : %h : %h : %b : %b : %b", 
            // uut.pc, uut.id_ir, uut.reg_A, uut.reg_B, uut.reg_C,
            // d_addr, d_dataout, d_we, uut.gr[1], uut.gr[2], uut.gr[3],
            // uut.zf, uut.nf, uut.cf);

        i= DEFAULT_PC_ADDR*2;
        tmpi_datain = {`SET, `gr3, 4'b0000, 4'b0100};//reset the loop controller `gr7
        i_mem.I_RAM[ i] = tmpi_datain[7:0];  i = 1 + DEFAULT_PC_ADDR*2;
        i_mem.I_RAM[ i] = tmpi_datain[15:8]; i = 2 + DEFAULT_PC_ADDR*2;
        tmpi_datain = {`SET, `gr1, 4'b0000, 4'b0000};//reset the sum value
        i_mem.I_RAM[ i] = tmpi_datain[7:0];  i = 3 + DEFAULT_PC_ADDR*2;
        i_mem.I_RAM[ i] = tmpi_datain[15:8]; i = 4 + DEFAULT_PC_ADDR*2;
        // i_mem.I_RAM[ 2] = {`NOP, 11'b000_0000_0000};
        // i_mem.I_RAM[ 3] = {`NOP, 11'b000_0000_0000};
        // i_mem.I_RAM[ 4] = {`NOP, 11'b000_0000_0000};
        tmpi_datain = {`ADD, `gr1, 1'b0, `gr1, 1'b0, `gr3};//set the loop controller `gr7 = 25
        i_mem.I_RAM[ i] = tmpi_datain[7:0];  i = 5 + DEFAULT_PC_ADDR*2;
        i_mem.I_RAM[ i] = tmpi_datain[15:8]; i = 6 + DEFAULT_PC_ADDR*2;
        // i_mem.I_RAM[ 7] = {`NOP, 11'b000_0000_0000};
        // i_mem.I_RAM[ 8] = {`NOP, 11'b000_0000_0000};
        tmpi_datain = {`SUBI, `gr3, 4'b0000, 4'b0001};//sum += `gr7
        i_mem.I_RAM[ i] = tmpi_datain[7:0];  i = 7 + DEFAULT_PC_ADDR*2;
        i_mem.I_RAM[ i] = tmpi_datain[15:8]; i = 8 + DEFAULT_PC_ADDR*2;
        
        //if (`gr3 != 0) go to I_RAM[ 9];
        //make sure to include the offset for DATA SRAM
        tmpi_datain = {`BNZ, `gr0, 4'b0001, 4'b0010};
        
        i_mem.I_RAM[ i] = tmpi_datain[7:0];  i = 9 + DEFAULT_PC_ADDR*2;
        i_mem.I_RAM[ i] = tmpi_datain[15:8]; i = 10+ DEFAULT_PC_ADDR*2;
        // i_mem.I_RAM[11] = {`NOP, 11'b000_0000_0000};
        // i_mem.I_RAM[12] = {`NOP, 11'b000_0000_0000};
        // i_mem.I_RAM[13] = {`NOP, 11'b000_0000_0000};
        tmpi_datain = {`STORE, `gr1, 1'b0, `gr0, 4'b0010};//if (`gr7 != 0) go to I_RAM[ 9];
        i_mem.I_RAM[ i] = tmpi_datain[7:0];  i = 11+ DEFAULT_PC_ADDR*2;
        i_mem.I_RAM[ i] = tmpi_datain[15:8]; i = 12+ DEFAULT_PC_ADDR*2;
        // i_mem.I_RAM[15] = {`NOP, 11'b000_0000_0000};
        // i_mem.I_RAM[16] = {`NOP, 11'b000_0000_0000};
        // i_mem.I_RAM[17] = {`NOP, 11'b000_0000_0000};
        tmpi_datain = {`HALT, 11'b000_0000_0000};//due to the pipeline, we need to add many `NOP to the instruction set
        i_mem.I_RAM[ i] = tmpi_datain[7:0];  i = 13+ DEFAULT_PC_ADDR*2;
        i_mem.I_RAM[ i] = tmpi_datain[15:8]; i = 14+ DEFAULT_PC_ADDR*2;
        // i_mem.I_RAM[19] = {`NOP, 11'b000_0000_0000};
        // i_mem.I_RAM[20] = {`NOP, 11'b000_0000_0000};
        // i_mem.I_RAM[21] = {`NOP, 11'b000_0000_0000};
        
        i = 0;
        tmpi_datain = 16'h00AB;
        i_mem.I_RAM[ i] = tmpi_datain[7:0];  i = 1;
        i_mem.I_RAM[ i] = tmpi_datain[15:8]; i = 2;
        tmpi_datain = 16'h3C00;
        i_mem.I_RAM[ i] = tmpi_datain[7:0];  i = 3;
        i_mem.I_RAM[ i] = tmpi_datain[15:8]; i = 4;
        tmpi_datain = 16'h0000;
        i_mem.I_RAM[ i] = tmpi_datain[7:0];  i = 5;
        i_mem.I_RAM[ i] = tmpi_datain[15:8]; i = 6;
        // i_mem.D_RAM[0] = 16'h00AB;
        // i_mem.D_RAM[1] = 16'h3C00;
        // i_mem.D_RAM[2] = 16'h0000;

        #10 rst_n = 0; LOAD_N = 0;
        #10 rst_n = 1;

        for (i = DEFAULT_PC_ADDR; i<7+ DEFAULT_PC_ADDR; i=i+1) begin
            tmpi_adder = (i<<1);
            tmpi_all = {tmpi_adder, i_mem.I_RAM[tmpi_adder]};
            
            #10 enable = 1;
            for (j = 0; j < REG_BITS_WIDTH; j=j+1) begin
                #10; SI = tmpi_all[j];
            end
            for (j = 0; j < REG_BITS_WIDTH; j=j+1) begin
                if (RDY) begin
                    j = REG_BITS_WIDTH;
                end
                #10;
            end
            #10 enable = 0;
            
            #10 enable = 1;
            tmpi_adder = tmpi_adder + 1;
            tmpi_all = {tmpi_adder, i_mem.I_RAM[tmpi_adder]};
            for (j = 0; j < REG_BITS_WIDTH; j=j+1) begin
                #10; SI = tmpi_all[j];
            end
            for (j = 0; j < REG_BITS_WIDTH; j=j+1) begin
                if (RDY) begin
                    j = REG_BITS_WIDTH;
                end
                #10;
            end
            #10 enable = 0;
        end
        // #10 start =1;
        // #10 start = 0;
        // for (j=1; j<40; j=j+1)
            // #100;
        #3130;
        
        // print the inner instructions
        force   CEN = 1;//enable RA1SHD_ibm512x8
        force   d_we = 1;//write module
        for (i = DEFAULT_PC_ADDR; i<7+ DEFAULT_PC_ADDR; i=i+1) begin
            //$write("%4x\t", (i<<1));
            tmpi_adder = (i<<1) + 1;
            #10 force   m_addr = tmpi_adder;
                force   m_datain = i_mem.I_RAM[tmpi_adder];
            #10;// a rising edge for SRAM
            //$write("%8b ", m_dataout);
            #10 release m_addr; release m_datain;
            
            tmpi_adder = (i<<1) + 0;
            #10 force   m_addr = tmpi_adder;
                force   m_datain = i_mem.I_RAM[tmpi_adder];
            #10;// a rising edge for SRAM
            //$write("%8b ", m_dataout);
            #10 release m_addr; release m_datain;
            //$display("");
        end
        #10 release CEN; release d_we;
        #1000;
        
        force   CEN = 1;//enable RA1SHD_ibm512x8
        force   d_we = 0;//read module
        for (i = DEFAULT_PC_ADDR; i<7+ DEFAULT_PC_ADDR; i=i+1) begin
            $write("%4x\t", (i<<1));
            tmpi_adder = (i<<1) + 1;
            #10 force   m_addr = tmpi_adder;
            #10;// a rising edge for SRAM
            $write("%8b ", m_dataout);
            #10 release m_addr;
            
            tmpi_adder = (i<<1) + 0;
            #10 force   m_addr = tmpi_adder;
            #10;// a rising edge for SRAM
            $write("%8b ", m_dataout);
            #10 release m_addr;
            $display("");
        end
        
        #10 release CEN; release d_we;
        $stop();//
    end
    
    always #5
        clk = ~clk;
      
endmodule

