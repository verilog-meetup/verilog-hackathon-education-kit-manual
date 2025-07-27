module full_adder_testbench;

    timeunit      1ns;
    timeprecision 1ps;

    logic a, b, carry_in, sum, carry_out;

    full_adder dut_instance
    (
        .a (a), .b (b), .carry_in  (carry_in),
        .sum (sum),     .carry_out (carry_out)
    );

    initial
    begin
        $dumpvars (0, dut_instance);

        a        = 1'b0;
        b        = 1'b1;
        carry_in = 1'b1;

        # 10

        if (sum === 1'b0 & carry_out === 1'b1)
            $display ("PASS");
        else
            $display ("FAIL: Unexpected result: %b", { carry_out, sum });

        $finish;
    end

endmodule
