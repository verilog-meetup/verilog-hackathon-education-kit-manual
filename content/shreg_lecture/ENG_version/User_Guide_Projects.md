## Working with Gowin FPGA using ```Sipeed Tang Primer 20k``` example without scripts

Here we will talk about how to make your projects for FPGA and program it.
You should not expect from this document training in the development of circuits, here is an introduction to the board and ```Gowin EDA```.

Open the program. Create a project:

![](../images_UG/media/image1.png)

![](../images_UG/media/image2.png)

![](../images_UG/media/image3.png)

Select FPGA

![](../images_UG/media/image4.png)

Created new file

![](../images_UG/media/image5.png)

Select System Verilog file type

![](../images_UG/media/image6.png)

![](../images_UG/media/image7.png)

```logic``` inputs/outputs - not good

![](../images_UG/media/image8.png)

Run synthesis

![](../images_UG/media/image9.png)

Errors

![](../images_UG/media/image10.png)

```wire``` inputs/outputs

![](../images_UG/media/image11.png)

System Verilog description

```systemverilog
module test (
 input  wire a,
 input  wire b,
 output wire c
);

assign c = a ^ b;

endmodule
```

Run Synthesis

![](../images_UG/media/image9.png)

It's work !

![](../images_UG/media/image12.png)

double click on p&r

![](../images_UG/media/image13.png)

![](../images_UG/media/image14.png)

Pin Planer

![](../images_UG/media/image15.png)

You need to select pins on the FPGA

![](../images_UG/media/image16.png)

![](../images_UG/media/image17.png)

![](../images_UG/media/image18.png)

![](../images_UG/media/image19.png)

How to know, what pin is LED or switch

![](../images_UG/media/image20.png)

 LED's pins

![](../images_UG/media/image21.png)

Switched pins

![](../images_UG/media/image22.png)

 Selected pins on Pin Planer

![](../images_UG/media/image23.png)

![](../images_UG/media/image24.png)

Choose jtag with this switch for programming

![](../images_UG/media/image25.png)

Programming

![](../images_UG/media/image26.png)

![](../images_UG/media/image27.png)

![](../images_UG/media/image28.png)

Start programming

![](../images_UG/media/image29.png)

Programming finished with no errors

![](../images_UG/media/image30.png)

FPGA test 1

![](../images_UG/media/image31.png)

FPGA test 2

![](../images_UG/media/image32.jpeg)

FPGA test 3

![](../images_UG/media/image33.jpeg)

FPGA test 4

![](../images_UG/media/image34.jpeg)


