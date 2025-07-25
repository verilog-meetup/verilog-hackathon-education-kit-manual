**Пример детектирования последовательности с помощью сдвигового
регистра.**

Сейчас мы рассмотрим применение сдвигового регистра не только как
"задержатора", но и при детектировании последовательностей (например,
228)

**Концептуальная схема (без reset)**

![](../images_shreg/image5.png)

**Схема с reset (rst нужен для сброса сдвигового регистра в известное
состояние)**

![](../images_shreg/image6.png)

**Проверка работы схемы**

![](../images_shreg/image7.png)

Разумеется, конкретно по данной временной диаграмме сказать, что схема
100% рабочая нельзя, но в качестве обоснования того, что она хотя как-то
работает можно.


**Описание примера на System Verilog**

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

**Task 5_1. Детектирование последовательностий с помощью Shift Register**

Пускай нам подают значения, и надо детектировать последовательность
12345.

Решите данную задачку на System Verilog (опираясь на пример выше)
