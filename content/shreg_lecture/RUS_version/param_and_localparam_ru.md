## Loclparam

В System Verilog имеется весьма удобная конструкция ```localparam```,
которая позволяет при изменении какого-то параметра схемы не исправлять его в условных 100 строчках кода, а поменять только в 1 месте
(можно сказать, что это некий аналог private параметром модуля (доступ к ним только внутри этого модуля) ( в отличие от ```parameter```, который является public параметром модуля (можно менять его из внешнего модуля)).

Например, если мы напишем:
```systemverilog
localparam ADD = 5'd0
assign compare = (opcode == ADD)
```
То для синтезатора это будет эквивалентно:
```systemverilog
assign compare = (opcode == 5'd0)
```
То есть, ```localparam``` увеличивает читаемость кода, но функционально на него никак не влияет.
Проверим сказанные выше слова на простейших примерах:

**Пример 1. Компаратор**

Код без localparam
```systemverilog
module equals_check (
	input [3:0] data_in,
	output equals
);

assign equals = (data_in == 4'd6);

endmodule
```
Код с localparam
```systemverilog
module equals_check (
	input [3:0] data_in,
	output equals
);

localparam const_for_compare = 4'd6;
assign equals = (data_in == const_for_compare);

endmodule
```
Во всех случаях синтезировалась одна и та же схема (можете убедиться в ```RTL-viewer```)

 
**Пример 2. Опкоды для АЛУ**

Также, если нужно объявить некое множество констант, то можно сделать так:

**Вариант 1.**

Объявление ```localparam``` по одному.

```systemverilog
localparam ALU_ADD = 2'd0;
localparam ALU_ZERO = 2'd1;
localparam ALU_OR = 2'd2;
localparam ALU_AND = 2'd3;
```

**Вариант 2.**
Объявление ```localparam``` вместе

```systemverilog
localparam 
	ALU_ADD = 2'd0,
	ALU_ZERO = 2'd1,
	ALU_OR = 2'd2,
	ALU_AND = 2'd3;
```

Чтобы еще раз убедится в удобстве данной конструкции, рассмотрим пример с простейшим АЛУ.

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
Данный код полностью эквивалентен коду ниже с учетом того, что код ниже является как менее читаемым и удобным (а удобство для отладки важно),
так и требущим больше усилий для исправления.

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

**Пример 3. ```localparam``` как некая функция от ```parameter```**

Например, мы хотим, чтобы счетчик считал до некоего параметризированного значения, и хотелось бы, чтобы разрядность счетчика подбиралась сама в зависимости от параметра.

Данную проблему решает ```localparam```

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
