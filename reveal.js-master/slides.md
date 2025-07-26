## Verilog Hackathon Education Kit Manual

<div style="text-align: center;">
<img src="../images/basic_board_setup_1.jpg" alt="workshop" width="500" height="400">
</div>

---

# Agenda

### Part 1: Foundations

***1. Why Verilog?**
<!-- .element: class="fragment" data-fragment-index="1" -->


---

# Foundation

This Manual and labs are a comprehensive introduction to Verilog Hardware Description Language (HDL), designed for both beginners and experienced engineers looking to deepen their understanding of digital system design. Whether you're new to Verilog or aiming to strengthen your skills, this course offers a solid foundation in modeling, simulating, and synthesizing digital logic. You’ll learn how to describe complex hardware systems using Verilog, with hands-on experience targeting both FPGA and ASIC platforms.

Through progressive modules, real-world labs, and capstone projects, you'll gain practical skills applicable to embedded systems, electronics engineering, and chip design industries. This course balances conceptual understanding with industry-relevant application, making it ideal for students, hobbyists, and professionals alike.

This Verilog Manual will walk you through a set of Labs and Exercises that will quickly let you see the results of your Verilog code implemented in hardware.  You will learn through hands-on-labs that will take you from simple Verilog syntax to more complex structures. The Lessons will explain the code, and the Labs will provide challenges implementing the concepts from the Lessons. This Tutorial will not go very deep into Simulation or Testbenches.  The goal is to teach basic Verilog syntax, and quickly see its implementation in the kit Hardware.

While the Verilog design flows described in this Manual can target multiple FPGAs boards & ASIC tools flows, most design flows described in this manual,  will target the Gowin Sipeed Tang Nano 9K FPGA Development Board (GOWIN GW1NR-9)  

---

# Why Verilog?

Digital circuits primarily consist of interconnected transistors. We analyze these circuits with the aid of
hierarchical structure. 
<!-- .element: class="fragment" data-fragment-index="1" -->

Hierarchical structure allow us to represent a digital circuit by means of interconnected diagrams called Schematic.
<!-- .element: class="fragment" data-fragment-index="2" -->

But as the complexity of the circuit increases every two years according to Moore's law schematic intuitiveness becomes
a liability, so Hardware description Language like Verilog, SystemVerilog and VHDL came into picture.
<!-- .element: class="fragment" data-fragment-index="3" -->

---

# RTL Design

HDLs model the digital circuits in as RTL. Register Transfer refers to how the language describes the 
data flow between register and how to apply logical operations on the data.
<!-- .element: class="fragment" data-fragment-index="1" -->

<pre><code data-trim class="language-verilog">
module and_gate ( 
    input wire a, 
    input wire b, 
    output wire y 
); 
    assign y = a & b; 
end module
</code></pre>

---

# Constructs

Basic constructs of SystemVerilog includes :

SystemVerilog is used for generating RTL circuits. RTL circuits are used for 
generating both combination and sequential blo

---



