**Task 5_2. Использование Shift Register в качестве "задержатора"**

**Exercise 1**
Реализуйте операцию ```RESULT = a*b + c``` учитывая то, что:

1) ```c``` может меняться каждый такт
2) модуль ```mul``` выполняет умножение за 32 такта

**Диаграммы вычислений mul**

![](../images_shreg/image9.png)

![](../images_shreg/image12.png)

В качестве подсказки можете использовать концептуальную схему ниже

![](../images_shreg/image8.png)


Также, имеется уже описание параметризованного Shift Register

```systemverilog
module parametrised_shift_reg
#(parameter number_stages = 10) (
	input in_shreg,
	input clk,
	output out_shreg
);

logic [number_stages : 0] shift_reg;


assign shift_reg [0] = in_shreg;
assign out_shreg = shift_reg [number_stages];

int i;

always_ff @(posedge clk) begin
	for (i = 1; i<= number_stages; i++) begin
		shift_reg [i] <= shift_reg [i-1];
	end

end

endmodule
```
Ниже картинка того, что синтезировалось по данному описанию (```number_stages = 10```)

![](../images_shreg/image10.png)

Диаграмма, показывающая, что данная схема задерживает входное значение на 10 тактов

![](../images_shreg/image11.png)

Читателю для применения данной схемы в ```a * b + c``` необходимо :

1) превратить однобитные провода в 32-битные шины
2) добавить сигнал ```rst```, который зануляет все триггеры

**Exercise 2. Еще один пример использования Shift Register в качестве "задержатора"**

Пускай у нас имеется 2 сумматора с различными задержками при вычислении (в самом задании эти задержки будут моделироваться сдвиговыми регистрами)

Задержка сумматора 1 = 5 clk, сумматора 2 = 9 clk. 

Найдите результат сравнения ```COMPARE = ((a + b) == (c + d))```, если результат суммы держится ровно 1 такт на каждом сумматоре (компаратор считаем идеальным)

**Поясняющая схема к условию**

![](../images_shreg/image13.png)

**Примерные шаги при решении задачи**
1) Найти ```N```
2) Поставить ```N``` в ```parameter number_stages = N```
3) Подключить модули друг к другу
