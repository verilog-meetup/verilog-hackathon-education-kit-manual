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
