## Appendix B. The role of RTL design in the whole chip project in an electronic company

An electronic company designs a chip through the collaboration of several
teams:

1. The technical marketing team, which defines what the customers expect
from a design. By customer we mean system design companies that use chips as
components in their products: telephones, medical devices, embedded
computers inside spaceships.

2. Architecture team that puts a document, the architecture spec, which
defines a high-level structure how different blocks divide the
functionality. The example of functionality is replacing a header in a
network packet or rotating in 3D space a triangle in GPU.

3. RTL (Register Transfer Level) design team, where each block's
microarchitect converts the architecture spec into a more detailed
microarchitecture spec for his block, defining how to implement the required
function using clocks, logical formulas and structures that consist of
D-flip-flops, the storage elements. The RTL design engineer writes code in
SystemVerilog based on this specification.

4. The modeling team writes the programs in C++ and Python that imitate the
action of RTL blocks. Such program, called a model, usually follows the
architecture spec, but not the microarchitecture spec. Instead of modeling
clocks, the models works with so-called transactions, groups of data
elements coming in and out of the device or a block of this device. An
example of a transaction is a network packet or a load request from CPU to
the memory. An architectural model of a CPU also works with CPU
instructions.

5. The design verification (DV) team creates the tests that compare the
behaviour of RTL blocks written in Verilog against the model. RTL, Modeling
and DV teams work together on debugging.

6. The physical design team runs synthesis and place-and-route tools to
convert the RTL description into a mask for the final chip. They work
together with RTL team to keep maximum possible clock frequency and physical
area of the design under control. Not all operations of the phisycal design
team are fully automated - they need to guide the tools with manually
created floorplan, a large-scale plan of the chip, where the position of the
embedded memories and large blocks may affect the timing delays and wire
congestion.

7. Last but not least, there are software teams that work with the
architecture team on the device drivers, compilers and other software to
ensure its compatibility with the hardware of the new chip on the market.

---

**To put in the main text**

RTL design is the central methodology to design a digital part of a chip,
but this is only a part of a much larger team effort. We are not going to
describe in this manual other parts, such as the art of functional
verification or the dark magic of the physical design, but you can get a
brief overview in *Appendix B. The role of RTL design in the whole chip
project in an electronic company*.

RTL engineer together with a physical design engineer use the following
flow, called RTL-to-GDSII flow:

...

The flow for FPGA is similar but has the following differences:

...

---

![The chip design team by blocks](https://github.com/verilog-meetup/verilog-hackathon-education-kit-manual/blob/main/images/team_1_by_blocks.png)

![A block design team](https://github.com/verilog-meetup/verilog-hackathon-education-kit-manual/blob/main/images/team_2_block.png)

The pictures above are created by Yuri Panchul for the article in
[aireport.ru/ai_hardware](https://aireport.ru/ai_hardware).
