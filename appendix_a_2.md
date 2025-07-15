### A.2. Use only packed arrays with most significant bit on the left

Packed array is an array with dimensions written before the name:

```SystemVerilog
logic [7:0][3:0] packed_array;
```

Unpacked array is an array with dimensions written after the name:

```SystemVerilog
logic unpacked_array [0:3][0:7];
```

It is a standard practice to write packed dimensions with descending bit range
`[7:0]` and unpacked dimensions with ascending bit range `[0:7]`. It is
important to follow this practice, otherwise indexing would be in the
reverse order of what most people expect (index 0 would actually point
to MSB of a value).

Unpacked arrays also have a shortcut for dimension declaration:

```SystemVerilog
logic unpacked_array [4][8];
```

In the example above, `[4][8]` is an equivalent of `[0:3][0:7]`.

It is also possible to mix dimensions:

```SystemVerilog
logic [7:0] multidimensional_array [0:3];
```

Where `[7:0]` is a packed dimension, and `[0:3]` is an unpacked dimension.

The advantage of packed arrays is that all dimensions together behave
as a single vector. So you could perform all operations that you can
perform on a vector. On the other hand, unpacked arrays require either
reference by index to perform operations with it, or casting RHS to
unpacked array before assignment.

```SystemVerilog

logic [3:0] packed_array;
logic unpacked_array [4];

// Only possible with packed arrays
assign packed_array = '1;
wire all_ones = &packed_array;

// Unpacked array casting before assignment
assign unpacked_array = '{0, 1, 0, 1};
```

When you iterate through arrays, indexing goes from left to right, from
unpacked to packed.

For example:

```SystemVerilog
logic [7:0] [31:0] multidimensional_array [0:3][0:15];
```

If indexing `multidimensional_array[i][j][k][h]`, `i` should be in range
`[0:3]`, `j` should be in range `[0:15]`, `k` should be in range `[7:0]` and
`h` should be in range `[31:0]`.

Packed and unpacked arrays were introduced in SystemVerilog, plain Verilog
had only single packed dimension (also called vector), and arrays with
unpacked dimensions were called memories.

The most common use of an array with unpacked dimension is to model a memory
(ROM, RAM or register file). Also FPGA tools can recognize patterns for
memory inference when unpacked array is used in a certain way.

Most open source tools that we use have limited support for unpacked arrays,
so they should be avoided outside of simple memory modeling.

### A.3. Use only "always_comb" and "always_ff" and never "always @ (a or b)", "always @*" or always_latch

`always_comb`, `always_ff` and `always_latch` were introduced in SystemVerilog
as an alternative to general purpose `always` block. All of those
SystemVerilog procedures have significant advantages, so we advice that
`always` should never be used in modern RTL code.

#### always_comb

`always_comb` has a number of advantages over `always @(a or b)` and
`always @*`.

`always_comb` has implicit sensitivity list.
Sensitivity list is a list of events that make block re-evaluate its contents.

For example, let's say that you describe the following combinational logic

```Verilog
always @(a or b)
    c = a & b;
```

In a code above, if `a` or `b` changes, the value of `c` updates.
Then, later on, you've changed the logic function inside the block

```Verilog
always @(a or b)
    c = a & b & d;
```

But you forgot to manually update the sensitivity list (it is still `a or b`).
So if the value of `d` would change while `a` and `b` are constant, `c`
won't be updated.

`always` block has `*` wildcard to add all signals to the sensitivity list
`always @*`, but signals inside function body won't be included.

```Verilog
function func(input in);
    func = a && in;
endfunction

always @* begin
    res = func(b);
end
```

`res` would update only when `b` changes, ignoring `a`.

```SystemVerilog
function func(input in);
    func = a && in;
endfunction

always_comb begin
    res = func(b);
end
```

`always_comb` would include both `a` and `b` in sensitivity list.

`always_comb` is executed once at time zero of simulation.

```Verilog
always @*
    a = 1'b1;
```

Signal `a` would never get a value, because sensitivity list is empty and
would never trigger.

```SystemVerilog
always_comb
    a = 1'b1;
```

Signal `a` would get a value at time zero of simulation.

`always_comb` also prevents not synthesizable anti-patterns like blocking
timing and event controls.

The following code is valid (for simulation, not synthesis):

```Verilog
always @* begin
    a = b;
    @(posedge clk);
    #1;
    a = c;
end
```

But in `always_comb` it would result in an error.

```SystemVerilog
always_comb begin
    a = b;
    @(posedge clk);
    #1;
    a = c;
end
```

Most importantly, `always_comb` is indicating an intention to describe
combinational logic, and a tool would issue a warning or error if the
contents of the block doesn't represent that behavior.

This is very helpful, because a common begginer mistake is to
accidentally infer a latch in combinational always block.

#### always_ff

`always_ff` is used to infer flip-flop logic. It allows only 1 event control
statement and a tool should issue a warning if the block doesn't represent
sequential logic.

The following code is valid (in simulation):

```SystemVerilog
always @(posedge clk) begin
    a <= 1'b1;
    @(posedge clk);
    a <= 1'b0;
end
```

And using `always_ff` results in an error:

```SystemVerilog
always_ff @(posedge clk) begin
    a <= 1'b1;
    @(posedge clk);
    a <= 1'b0;
end
```

#### always_latch

`always_latch` is used to describe latch behavior and would issue a warning
if the description doesn't represent a latch.

(We should insert Yuri's text about latches here, I couldn't find it quickly)
