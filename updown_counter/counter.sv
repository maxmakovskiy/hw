module updown_counter(
    input logic clk,
    input logic up,
    input logic reset,
    output logic [7:0] q
);
    logic [7:0] s, mux;

    always_comb 
    begin
        mux = up ? 8'b0 : 8'b1111_1110;
        s = mux + q + 1'b1;
    end

    always_ff @(posedge clk,
                posedge reset)
        if (reset) q <= 8'b0;
        else q <= s;

endmodule