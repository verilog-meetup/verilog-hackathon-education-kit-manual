## Appendix A. A subset of the SystemVerilog language that we use in this manual

SystemVerilog is a result of long language evolution. When the original
Verilog appeared in 1984, it was intended for simulation, not synthesis. The
design of some language features provoked designers to make bugs, such as
race conditions when using blocking assignments in edge-sensitive always
blocks. Some constructs, such as “reg” ended up being used not in a way
their name suggests (“reg” is not always a register).

SystemVerilog, which development started in 2001, is effectively a mix of
three languages: Verilog-2001, Vera and Superlog, with some features from
VHDL, plus three special mini languages added: for random constraints,
functional coverage groups and concurrent assertions. SystemVerilog added
improved constructs, such as “always_comb” instead of “always @*” to help
the designer avoid some common bugs. There are also some features that were
added to the standard but very rarely used by design or verification
engineers, an example of such a feature is the “program” keyword.

For this manual and its associated examples, we have defined a minimal
subset of SystemVerilog, along with guidelines that facilitate reliability.
We want the design to behave as expected, without hours of debugging. At the
same time we would like to mention language constructs used in other Verilog
texts, to avoid our readers asking questions “why do they use a feature ABC
instead of the feature XYZ?”

### A.1. Use “logic” and sometimes “wire”, but not “reg”, “tri” or “bit”

Many tutorials on the internet, as well as older books, use not
SystemVerilog, but Verilog-2001 or even Verilog-95. Both are informally
called “plain Verilog”. Plain Verilog had two main constructs that define
variables: “reg” and “wire”. In synthesis, “wire” always inferred
combinational logic, but “reg” may infer either combinational logic, or
registers that consist of D-flip-flops, or even be used to model D-latches.

```Verilog
reg a, b;

// Synthesis will infer AND gate

always_comb
    a = c & d;

// Synthesis will infer AND gate feeding a D-flip-flop

always_ff @ (posedge clock)
    b <= c & d;
```

De facto, “reg” is simply a variable that can be assigned within an “always”
block and cannot be assigned using the “assign” construct. It also cannot be
connected to an output port of a submodule instance. All this usage is
possible with “wire”:

```Verilog
wire w1, w2;
assign w1 = b & c;
submodule submodule_instance (.clock (clock), .out_port (w2));
```

SystemVerilog added a new type called “logic” that combines the features of
“reg” and “wire”. You can assign to it either inside “always” block or using
“assign” continuous assignment. You can also use it to connect to an output
of a submodule.

In our examples we never use “reg” and mostly use “logic”. However, there is
a special case when we use “wire”. This case is the following shortcut we
find handy:

```Verilog
wire w3 = b & c;
```

It is equivalent to:

```Verilog
wire w3;
assign w3 = b & c;
```

It is also equivalent to:

```Verilog
logic w3;
assign w3 = b & c;
```

It is also equivalent to:

```Verilog
logic w3;
always_comb w3 = b & c;
```

However, it is _not_ equivalent to:

```Verilog
logic w3 = b & c;
```

The language designers made the last construct equivalent to initialization
before the simulation time 0:

```Verilog
logic w3;
initial w3 = b & c;
```

This can lead to a difficult-to-find bug, so watch out!

There is also such a thing as “wire logic w3” which is equivalent to “wire
w3”. Finally, there are constructs “tri” or “bit”, we don’t use them. “tri”
is effectively a “wire” and “bit” is similar to “logic”, but “bit” can take
only the values of “0” and “1” in simulation, unlike more standard “logic”
that can take the values “0”, “1”, “x” and “z”. See the IEEE 1800-2023
standard if you are curious and would like to see more details.
