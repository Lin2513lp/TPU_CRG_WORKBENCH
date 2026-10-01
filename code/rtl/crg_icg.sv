`timescale 1ns/1ps
`default_nettype none
module crg_icg (
    input wire logic clk_in,
    input wire logic enable,
    input wire logic test_enable,
    output logic clk_out
);
    // Combine the functional enable and test enable.
    wire logic gate_enable;
    assign gate_enable = enable | test_enable;

    // Capture enable only while the source clock is low.
    logic enable_latched;
    always_latch begin
        if (!clk_in) enable_latched <= gate_enable;
    end

    // Pass complete high pulses when the latched enable is set.
    assign clk_out = clk_in & enable_latched;
endmodule
`default_nettype wire
