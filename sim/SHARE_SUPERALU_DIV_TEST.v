//+FHDR****************************************************************
// ECE department, TAMU
// --------------------------------------------------------------------
// FILE NAME    : SHARE_SUPERALU_DIV_TEST.v
// AUTHER       : Jiafan Wang
// DATE         : 01/01/2016
// VERSION      : 1.0
// PURPOSE      : testbench of the super ALU including *, / and sqrt
// --------------------------------------------------------------------
// ABSTRACT: loop-test simulation time 100ms given each time period 20ns
// --------------------------------------------------------------------
`timescale  1 ns / 100 ps


`include    "../SHARE_SUPERALU.v"

`define MAX_WIDTH   13
`define CADC_WIDTH  10
//`define MULT_LOOP_TEST
//`define DIVI_LOOP_TEST
//`define SQRT_LOOP_TEST

module  SHARE_SUPERALU_DIV_TEST();

    parameter   MULTIPLICAND_WIDTH  = 9,// the division of CF
                MULTIPLIER_WIDTH    = 8,// for the random value used by SA, it's the width of LFSR 
                EXTEND_WIDTH        = 3,
                MULTIPLICATION_WIDTH= 12,// multiplicand + extend width
                INDEX_WIDTH         = 4,// must can cover MULTIPLICATION_WIDTH
                MAX_SQRT_WIDTH      = 13;
    parameter   DIVIDEND_WIDTH      = 12,
                DIVIDOR_WIDTH       = 12,
                QUOTIENT_WIDTH      = 9;

    //Set the connecting wire
    reg     CLK;
    reg     RST_N;
    reg     [MAX_SQRT_WIDTH-1:0]  X_IN, Y_IN;
    reg     [9:0]   OFFSET;
    wire    [MAX_SQRT_WIDTH-1:0]  FOUT, POUT;
    integer i,j,e,error_cnt;
    real    m,n;
    
    reg     multiply_start;
    reg     sqrt_pow_start;
    reg     division_start;
    
    reg     [1:0]   mode_type;
    wire    [2:0]   alu_type;
    assign  alu_type = {multiply_start, division_start, sqrt_pow_start};
    
    reg     [MULTIPLICAND_WIDTH-1:0]    multiplicand;
    reg     [MULTIPLIER_WIDTH-1:0]      multiplier;
    
    reg     [DIVIDEND_WIDTH-1:0]        dividend;
    reg     [DIVIDOR_WIDTH-1:0]         dividor;
    
    wire    [QUOTIENT_WIDTH-1:0]        signed_division;
    wire    [MULTIPLICATION_WIDTH-1:0]  multiplication;
    wire     multiply_done;
 
    assign  multiplication = FOUT[MULTIPLICATION_WIDTH-1:0];
    assign  signed_division = FOUT[QUOTIENT_WIDTH-1:0];
 
    //Invoke the SA module
    SHARE_SUPERALU   ALU_01(.CLK(CLK),
                        .RST_N(RST_N),
                        .X_IN(X_IN),//multiplicand
                        .Y_IN(Y_IN),//multiplier
                        .alu_start(multiply_start || division_start || sqrt_pow_start),
                        .alu_type(alu_type),
                        .mode_type(mode_type),
                        .OFFSET(OFFSET),

                        .FOUT(FOUT),//multiplication
                        .POUT(POUT),
                        .alu_is_done(multiply_done));


    //Invoke the SA tb module
    /*CF_4D_tb_module CF_TB(.ANA_BITS(ANA_BITS),
                        .NXT(NXT),

                        .CLK(CLK),
                        .RST_N(RST_N),
                        .ADC_NUM(ADC),
                        .TUNE_READY(TUNE_READY),
                        .FLAG4D(FLAG4D));*/
    
    parameter   CLK_PERIOD  = 20;
    
    
    // Initial Settings
    initial
    begin
        error_cnt = 0;
        //NXT = 1'b0;
        CLK = 1'b0;
        RST_N = 1'b0;
        multiply_start = 0;
        division_start = 0;
        sqrt_pow_start = 0;
        #CLK_PERIOD RST_N = 1'b1; 
 
        
        ////////////////////////////////////////////////////////
        $display($time, "\n//////// (2) Division test ////////");
        // parameter   SA_DIV          = 0, //deltaE/T, deltaE always smaller than T
                    // CF_T27          = 1, //9'b11_1111111
                    // CF_T36          = 2; //9'b100_000000
        //alu_type = 4'b0100;

        dividend = 42;
        dividor = 27;// 42/27 * 128 = 199
        mode_type = 2'b01;
        X_IN = {1'b0, dividend};
        Y_IN = {1'b0, dividor};
        
        #(CLK_PERIOD*2) division_start = 1'b0;
        #(CLK_PERIOD*2) division_start = 1'b1;
        // Test 1_1: A/B, A>B  
        for (i = 0; i <= 1000; i=i+1) begin
            for (j = 0; j <= 1000; j=j+1) begin
                 #CLK_PERIOD;
                 if (ALU_01.alu_is_done) begin
                     i = 1000; j = 1000;//$stop();
                     $display($time, " result = %d\tactual = %d", signed_division, dividend*128/dividor);
                     if (signed_division != (dividend*128/dividor)) begin
                        $display($time, "\t---- Potential Error here! ----");
                        error_cnt = error_cnt + 1;
                     end
                 end
            end
        end

        dividend = 142;
        dividor = 270;//142/270 * 64 = 33
        mode_type = 2'b10;
        X_IN = {1'b0, dividend};
        Y_IN = {1'b0, dividor};
        
        #(CLK_PERIOD*2) division_start = 1'b0;
        #(CLK_PERIOD*2) division_start = 1'b1;
        // Test 1_1: A/B, A>B  
        for (i = 0; i <= 1000; i=i+1) begin
            for (j = 0; j <= 1000; j=j+1) begin
                 #CLK_PERIOD;
                 if (ALU_01.alu_is_done) begin
                     i = 1000; j = 1000;//$stop();
                     $display($time, " result = %d\tactual = %d", signed_division, dividend*64/dividor);
                     if (signed_division != (dividend*64/dividor)) begin
                        $display($time, "\t---- Potential Error here! ----");
                        error_cnt = error_cnt + 1;
                     end
                 end
            end
        end
        
        dividend = 42;
        dividor = 170;//42/170 * 256 = 63
        mode_type = 2'b00;
        X_IN = {1'b0, dividend};
        Y_IN = {1'b0, dividor};
        
        #(CLK_PERIOD*2) division_start = 1'b0;
        #(CLK_PERIOD*2) division_start = 1'b1;
        // Test 1_1: A/B, A>B  
        for (i = 0; i <= 1000; i=i+1) begin
            for (j = 0; j <= 1000; j=j+1) begin
                 #CLK_PERIOD;
                 if (ALU_01.alu_is_done) begin
                     i = 1000; j = 1000;//$stop();
                     $display($time, " result = %d\tactual = %d", signed_division, dividend*256/dividor);
                     if (signed_division != (dividend*256/dividor)) begin
                        $display($time, "\t---- Potential Error here! ----");
                        error_cnt = error_cnt + 1;
                     end
                 end
            end
        end
        
        dividend = 42;
        dividor = 30;//42/30 * 256  (extrem case: deltaE/T always < 1)
        mode_type = 2'b00;
        X_IN = {1'b0, dividend};
        Y_IN = {1'b0, dividor};
        
        #(CLK_PERIOD*2) division_start = 1'b0;
        #(CLK_PERIOD*2) division_start = 1'b1;
        // Test 1_1: A/B, A>B  
        for (i = 0; i <= 1000; i=i+1) begin
            for (j = 0; j <= 1000; j=j+1) begin
                 #CLK_PERIOD;
                 if (ALU_01.alu_is_done) begin
                     i = 1000; j = 1000;//$stop();
                     $display($time, " result = %d\tactual = %d", signed_division, dividend*256/dividor);
                     if (signed_division != (dividend*256/dividor)) begin
                        $display($time, "\t---- Potential Error here! ----");
                        error_cnt = error_cnt + 1;
                     end
                 end
            end
        end
        #(CLK_PERIOD*2) division_start = 1'b0;
        
        // Judge Final Test Result
        if (error_cnt)
            $display("Test Failed!");
        else
            $display("Test Passed!");
        $stop();
    end

    task cordic_test;
        begin
            #CLK_PERIOD sqrt_pow_start = 0;
            #CLK_PERIOD sqrt_pow_start = 1;

            //for (i=0; i<=8; i=i+1)  begin
            for (i=0; i<=8*16*2; i=i+1)  begin
                #CLK_PERIOD;
                if (ALU_01.alu_is_done) begin
                    //$display($time, " Amp Result = %d", FOUT);
                end
            end

            $display($time, " sqrt(pow(%d,2)+pow(%d,2))=%d, phase=%d", X_IN, Y_IN, FOUT, POUT);
        end
    endtask
    
    // Clock generation
    always begin
        #10 CLK = !CLK;
    end

    // Dump signals to view waveform
    // initial
    // begin
        // $dumpfile ("wave_super_alu.dump");
        // $dumpvars (0, SHARE_SUPERALU_TEST);
    // end


endmodule


