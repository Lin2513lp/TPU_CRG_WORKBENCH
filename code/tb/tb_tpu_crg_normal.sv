`timescale 1ns/1ps
`default_nettype none
module tb_tpu_crg_normal;
    reg sys_clk = 0;
    reg ahb_clk = 0;
    reg sys_rst_n = 1;
    reg dft_glb_gt_se = 0;
    reg dft_mode = 0;
    reg dft_lgc_rst_n = 1;
    reg cpu_tpu_crg_en = 0;
    reg cpu_tpu_sw_rst = 0;
    // Keep both size codes at 8: a 9x9 array with N-1 encoding.
    reg [3:0] cpu_h_size = 4'd8;
    reg [3:0] cpu_w_size = 4'd8;
    reg cpu_tpu_crg_bypass = 0;
    wire sys_ckg;
    wire [63:0] pe_ckg;
    wire tpu_rst_n;

    // Source clocks: 400 MHz system clock and 100 MHz AHB clock.
    always #1.25 sys_clk = ~sys_clk;
    always #5 ahb_clk = ~ahb_clk;

    tpu_crg dut (
        .dft_glb_gt_se(dft_glb_gt_se),
        .dft_mode(dft_mode),
        .dft_lgc_rst_n(dft_lgc_rst_n),
        .sys_clk(sys_clk),
        .ahb_clk(ahb_clk),
        .sys_rst_n(sys_rst_n),
        .cpu_tpu_crg_en(cpu_tpu_crg_en),
        .cpu_tpu_sw_rst(cpu_tpu_sw_rst),
        .cpu_h_size(cpu_h_size),
        .cpu_w_size(cpu_w_size),
        .cpu_tpu_crg_bypass(cpu_tpu_crg_bypass),
        .sys_ckg(sys_ckg),
        .pe_ckg(pe_ckg),
        .tpu_rst_n(tpu_rst_n)
    );

    // Enable FSDB recording when compiled by the VCS Makefile.
`ifdef FSDB_TRACE
    string fsdb_file;
    initial begin
        if (!$value$plusargs("FSDB_FILE=%s", fsdb_file))
            fsdb_file = "normal.fsdb";
        $fsdbDumpfile(fsdb_file);
        $fsdbDumpvars(0, tb_tpu_crg_normal);
    end
`endif

    initial begin
        // Keep DFT controls inactive; the active-low test reset stays high.
        #0.2 sys_rst_n = 0;
        #5 sys_rst_n = 1;
        #10;

        // Run the selected square array.
        #10 cpu_tpu_crg_en = 1;
        #30 cpu_tpu_crg_en = 0;
        #20;

        // Restart the same square array after the clocks have stopped.
        #10 cpu_tpu_crg_en = 1;
        #30;

        // Assert software reset during operation, then allow recovery.
        cpu_tpu_sw_rst = 1;
        #5 cpu_tpu_sw_rst = 0;
        #20 cpu_tpu_crg_en = 0;
        #20;

        // Functional bypass uses the same square array mask.
        #10 cpu_tpu_crg_bypass = 1;
        #20 cpu_tpu_crg_bypass = 0;
        #20;
        $display("DONE: tb_tpu_crg_normal");
        $finish;
    end
endmodule
`default_nettype wire
