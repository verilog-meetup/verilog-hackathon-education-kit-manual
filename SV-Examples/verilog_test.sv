// Board configuration: tang_nano_9k_lcd_480_272_tm1638_hackathon
// This module uses few parameterization and relaxed typing rules

module hackathon_top
(
    input  logic       clock,
    input  logic       slow_clock,
    input  logic       reset,

    input  logic [7:0] key,
    output logic [7:0] led,

    // A dynamic seven-segment display

    output logic [7:0] abcdefgh,
    output logic [7:0] digit,

    // LCD screen interface

    input  logic [8:0] x,
    input  logic [8:0] y,

    output logic [4:0] red,
    output logic [5:0] green,
    output logic [4:0] blue,


    inout  logic [3:0] gpio
);

    //------------------------------------------------------------------------

    // Gates, wires and continuous assignments

    //assign led [0] = key [0];
    //------------------------------------------------------------------------
    
    // Below the input Push Buttons, key [0] through key [7] are 
    // assigned to a wire pb_key_0 through pb_key_7 and then that wire 
    // is assigned to an output LED, led [0] through led [7]

    wire pb_key_0 = key [0];  // Note a new construct - wire
    wire pb_key_1 = key [1];
    wire pb_key_2 = key [2];
    wire pb_key_3 = key [3];
    wire pb_key_4 = key [4];
    wire pb_key_5 = key [5];
    wire pb_key_6 = key [6];
    wire pb_key_7 = key [7];

    // assign led [0] = pb_key_0;
    //assign led [1] = pb_key_1;
    assign led [2] = pb_key_2;
    assign led [3] = pb_key_3;
    assign led [4] = pb_key_4;
    assign led [5] = pb_key_5;
    //assign led [6] = pb_key_6;
    // assign led [7] = pb_key_7;

  // The following assign is creating an AND Logic function with the Wire 
  // connected to the Key [0] and key [7]
  // The output is connected directly to the 7-Segment digit [0]
  // Only when you push the key [0] AND key[1] will the digit light up 
  
    assign led [0] = pb_key_0 & pb_key_7;

  // Exercise 1: Create a new assign statment that uses the wire connected
    // to key [2] and key [6] and implements a OR Logic function, that is output 
  // to digit [1]
  // Add your assign statment below:
    assign led [1] = pb_key_2 | pb_key_6;
  
  // no code below this comment 
endmodule
