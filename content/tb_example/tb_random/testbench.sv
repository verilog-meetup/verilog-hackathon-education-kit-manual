/*

module full_adder_testbench;

    timeunit      1ns;
    timeprecision 1ps;

    logic a, b, carry_in, sum, carry_out;

    // Instantiating Design under Test - DUT

    full_adder dut_instance
    (
        .a (a), .b (b), .carry_in  (carry_in),
        .sum (sum),     .carry_out (carry_out)
    );

    logic [1:0] expected_2_bit_value;

    initial
    begin
        // $dumpvars is a directive that tells
        // Icarus Verilog to generate a Value Change Dump (VCD)

        $dumpvars;

        // A trivial direct test

        a        = 1'b0;
        b        = 1'b1;
        carry_in = 1'b1;

        # 10  // Wait for 10 abstract time units

        // Logging the result

        if (~ (sum === 1'b0 & carry_out === 1'b1))
            $display ("Unexpected result: %b", { carry_out, sum });

        // A random test with better logging and self-checking

        repeat (100)
        begin
            a        = $urandom ();
            b        = $urandom ();
            carry_in = $urandom ();

            expected_2_bit_value = a + b + carry_in;

            # 10

            // Logging

            $display ("%d a=%b b=%b carry_in=%b sum=%b carry_out=%b",
                $time, a, b, carry_in, sum, carry_out);

            // Checking

            if ({ carry_out, sum } !== expected_2_bit_value)
            begin
                $display ("ERROR: { carry_out, sum } is expected to be %b",
                    expected_2_bit_value);

                $finish;
            end
        end

        $finish;
    end

endmodule

*/

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
        $dumpvars;

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
