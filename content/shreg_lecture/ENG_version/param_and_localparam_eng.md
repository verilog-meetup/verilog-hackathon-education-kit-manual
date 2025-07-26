## Loclparam

System Verilog has a very convenient ```localparam``` construction,
which allows you to change some circuit parameter without having to correct it in 100 lines of code, but to change it only in 1 place
(we can say that this is a kind of analogue of a private parameter of a module (access to them only within this module) (unlike ```parameter```, 
which is a public parameter of a module (you can change it from an external module)).

For example, if we write:

```systemverilog
localparam ADD = 5’d0
assign compare = (opcode == ADD)
```
Then for a synthesizer this will be equivalent to:

```systemverilog
assign compare = (opcode == 5’d0)
```
That is, ```localparam``` increases the readability of the code, but does not affect it functionally.
Let's check the above words on the simplest examples:

**Example 1. Comparator**

description without ```localparam```

```systemverilog
module equals_check (
	input [3:0] data_in,
	output equals
);

assign equals = (data_in == 4'd6);

endmodule
```
Description with  ```localparam```

```systemverilog
module equals_check (
	input [3:0] data_in,
	output equals
);

localparam const_for_compare = 4'd6;
assign equals = (data_in == const_for_compare);

endmodule
```
In all cases the same circuit was synthesized (you can see it in ```RTL-viewer```)

 
**Example 2. ALU-opcodes**

Also, if you need to declare a certain set of constants, you can do it like this:

**Option 1.**

Declaring ```localparam``` one by one.

```systemverilog
localparam ALU_ADD = 2'd0;
localparam ALU_ZERO = 2'd1;
localparam ALU_OR = 2'd2;
localparam ALU_AND = 2'd3;
```

**Option 2.**

Declaring ```localparam``` in one block

```systemverilog
localparam 
	ALU_ADD = 2'd0,
	ALU_ZERO = 2'd1,
	ALU_OR = 2'd2,
	ALU_AND = 2'd3;
```

To once again convince ourselves of the convenience of ```localparam```, let's consider an example with the simplest ALU.

```systemverilog
module simple_alu (
	input  logic [7:0] a,
	input  logic [7:0] b,
	
	input  logic [1:0] opcode,
	
	output logic [7:0] alu_out
);


localparam ALU_ADD = 2'd0;
localparam ALU_ZERO = 2'd1;
localparam ALU_OR = 2'd2;
localparam ALU_AND = 2'd3;

localparam ALU_DEFAULT = 8'd0;

always_comb begin
	alu_out = ALU_DEFAULT;
	case(opcode) 
		ALU_ADD  : alu_out = a+b;
		ALU_ZERO : alu_out = 8'd0;
		ALU_OR   : alu_out = a | b;
		ALU_AND  : alu_out = a & b;
	endcase

end

endmodule
```

This code is completely equivalent to the code below, with the caveat that the code below is both less readable and maintainable (and maintainability is important for debugging) and requires more effort to fix.

```systemverilog
module simple_alu (
	input  logic [7:0] a,
	input  logic [7:0] b,
	
	input  logic [1:0] opcode,
	
	output logic [7:0] alu_out
);

always_comb begin
	alu_out = 8'd0;
	case(opcode) 
		2'd0  : alu_out = a+b;
		2'd1  : alu_out = 8'd0;
		2'd2  : alu_out = a | b;
		2'd3  : alu_out = a & b;
	endcase

end

endmodule
```

**Example 3. ```localparam``` as a function of ```parameter```**

For example, we want the counter to count to a certain parameterized value, and we would like the counter's bit depth to be selected automatically depending on the parameter.

```localparam``` solves this problem.

```systemverilog
module param_counter
#(parameter END_COUNT = 10) (
	input 			       clk,
	input 			       rst,
	
	output [NUM_BIT_COUNT - 1 : 0] out_counter
);

localparam NUM_BIT_COUNT = $clog2(END_COUNT);

always_ff @(posedge clk) begin
	if (rst || (out_counter == END_COUNT)) begin
		out_counter <= '0;
	end
	
	else begin
		out_counter <= out_counter + 1;
	end
end

endmodule
```
