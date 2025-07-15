### A.2. Use only packed arrays with most significant bit on the left
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
