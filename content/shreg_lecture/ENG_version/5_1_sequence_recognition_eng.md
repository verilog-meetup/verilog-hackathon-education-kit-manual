### Example of sequence detection using shift register.

In this task we will consider the use of the shift register as a detector of sequence.
Below is an example of detection of sequence ```228```

**Scheme without ```rst``` (reset)**

![](../images_shreg/image5.png)

**Scheme with reset (```rst``` is needed to reset the shift register to a known state)**

![](../images_shreg/image6.png)

**Circuit testing**

![](../images_shreg/image7.png)


**Example sequence detection in System Verilog**

```systemverilog
module detect_228 (
	input  logic [7:0] shreg_i,
	input   	   clk,
	input              rst,
	
	output logic       detected_228
);
logic [7:0] out_D_trig_1;
logic [7:0] out_D_trig_2;
logic [7:0] out_D_trig_3;

always_ff @(posedge clk) begin
	if(rst) begin 
		out_D_trig_1 <= 7'd0;
		out_D_trig_2 <= 7'd0;
		out_D_trig_3 <= 7'd0;
	end
	
	else begin
		out_D_trig_1 <= shreg_i;
		out_D_trig_2 <= out_D_trig_1;
		out_D_trig_3 <= out_D_trig_2;
	end
end

assign detected_228 = (out_D_trig_3 == 7'd2) &&
                      (out_D_trig_2 == 7'd2) &&
                      (out_D_trig_1 == 7'd8);
endmodule

```

**Exercise 5_1. Sequence detection with the shift register**

Sequentially (every ```posedge clk```) 8-bit numbers are fed to the detector. 
Detect the sequence of numbers ```1 2 3 4 5```

Solve this problem on System Verilog based on the example above.
