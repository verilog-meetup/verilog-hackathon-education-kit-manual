# Verilog Hackathon Education Kit Manual  
> [!NOTE] I will be doing a template update before Noon Monday June 30... if you want to start thinking, please do, but maybe don't actually make edits.
---
### Methods to show progress:
If you want to show you are still working or done, add the following:  
> [!NOTE]🚧- Construction emoji, means you are still working on this section  
> [!NOTE]✅- Done with this task
> [!NOTE]❌- red "x", means you are not done, have not started, or are in progress
> [!NOTE]📝- This is a note to others. You can assign these notes to all or to a specific person.  
> [!NOTE]❎- If you see a note 📝 assigned to you or if you are going to accept it, replace it with a ❎  

### Notes to Writers:
> [!NOTE] - Suggest a better title for this document  
> [!NOTE] - Just so you know, I'm (STEAM Clown) an going to be just editing this doc in place, so if you make a fork, just make sure you check it in correctly
> [!NOTE]🚧- I'm going to add a lab template, where we can each pick a lab and update that section.  

---
### Links That will be deleted later
* [MD cheat sheet](https://www.markdownguide.org/cheat-sheet/)
* [Old Google Document](https://docs.google.com/document/d/1Z1MZMz6SOwn6kjaCy0DiFt3yNVrN_1zEZgmNQC1ft-Q/edit?usp=sharing)
Presentations:
* [Workforce Development](https://bit.ly/ee-workforce-devel)
* [Verilog Meetup LA](https://bit.ly/Verilog-Meetup-in-LA-2024-08-31)
* [ADA Univ](https://bit.ly/ada-univ-sv-fpga-2024)
* [HackerDojo](https://bit.ly/Yuri-Panchul-Hacker-Dojo-2024-01-14)

---
# Verilog Hackathon Education Kit Manual
## About This Manual  
> [!NOTE]🚧- ❎- Assigned - STEAM Clown will update this later
  
This Manual and labs are a comprehensive introduction to Verilog Hardware Description Language (HDL), designed for both beginners and experienced engineers looking to deepen their understanding of digital system design. Whether you're new to Verilog or aiming to strengthen your skills, this course offers a solid foundation in modeling, simulating, and synthesizing digital logic. You’ll learn how to describe complex hardware systems using Verilog, with hands-on experience targeting both FPGA and ASIC platforms.   

Through progressive modules, real-world labs, and capstone projects, you'll gain practical skills applicable to embedded systems, electronics engineering, and chip design industries. This course balances conceptual understanding with industry-relevant application, making it ideal for students, hobbyists, and professionals alike.  

This Verilog Manual will walk you through a set of Labs and Exercises that will quickly let you see the results of your Verilog code implemented in hardware.  You will learn through hands-on-labs that will take you from simple Verilog syntax to more complex structures. The Lessons will explain the code, and the Labs will provide challenges implementing the concepts from the Lessons. This Tutorial will not go very deep into Simulation or Testbenches.  The goal is to teach basic Verilog syntax, and quickly see its implementation in the kit Hardware.  

While the Verilog design flows described in this Manual can target multiple FPGAs boards & ASIC tools flows, most design flows described in this manual,  will target the Gowin Sipeed Tang Nano 9K FPGA Development Board (GOWIN GW1NR-9)  


## Introduction - Verilog Hackathon Education Kit
> [!NOTE]🚧- Anyone can work on this... It is just a short overview of the kit, golas, and how to use it
## Introduction to The Verilog Language & Syntax
> [!NOTE]🚧- This section will give a overview of the Verilog language, and have a few sections on the Verilog syntax, but not have labs.  Some topics and sections are as follows:  
### Introduction to Digital Design and Verilog  
> [!NOTE]🚧- Anyone can work on this... It probably should link to an overview presentation  
### ASIC vs FPGA: What’s the Difference?  
> [!NOTE]🚧- Anyone can work on this... It probably should link to an overview presentation  
### Verilog Design Flow Overview (Simulation, Synthesis, Implementation)  
> [!NOTE]🚧- Anyone can work on this... It probably should link to an overview presentation  

## Introduction To Kit Hardware  
### Gowin FPGA Board - Tang-Nano Introduction 

#### 🛠️ LAB Activity: Install of the Gowin Tang-Nano FPGA tools - Installation & Build Steps  
> [!NOTE]🚧- ❎- STEAM Clown will update this later
In this 🛠️ Lab Activity, you are going to install the Gowan Tang-Nano FPGA tools.  You will verify that the installation is correct and ready to run the subsequent Verilog Labs. 

#### 🛠️ LAB Activity: Gowin FPGA Board - Tang-Nano Setup & Hardware Connections    
> [!NOTE]🚧- This section will show the connection of just the FPGA Board & GPIO board

#### 🛠️ LAB Activity: Hello World - Blinking An LED    
> [!NOTE]🚧- This section will show the working design, running the scripts, and seeing that the hardware works, proving that your systems is working.


---
## Verilog Labs
---
> [!NOTE] - The following are the Labs that are in the [Basic Music - Hackation](https://github.com/yuri-panchul/basics-graphics-music/tree/main) in the [Problems](https://github.com/yuri-panchul/basics-graphics-music/tree/main/hackathon/problems) directory.  What other labs should we have to teach basic Verilog?  
> [!NOTE] - STEAM CLown - I think that we should have a few more Labs to show using the GPIO board.  Also, maybe we should change the order of the labs, so we can do all the labs focused on the GPIO module before we start looking at the Display. Thoughts?  

### Gates & Muxes
#### Gates & Muxes Introduction
> [!NOTE] - This section should link to a presentation.  Short explanation can be here, but really this should be linked to a presentation, and other resources to teach about this.  My plan for my class is to have a presentation, "Dig Deeper" assignments, some additional resources, and then a set of quiz questions.  This will be implemented in a Canvas LMS, and I'll publish this later in Jan 2026.

Give an overview for this component.  Include a "Why are we doing this step in this order".  This can be a short or long or multiple paragraphs. 
Overview of component
* This Step will include… < list what they are going to accomplish >
* This Step should take about N minutes to complete. 

#### Logic Gates Verilog Code
> [!NOTE] - This section will show the Verilog code examples, explain how it works, and any new Verilog structures
**Logic Gates Verilog Code Introduction**
Add a overview of how Logic Gate code works, and a few paragraphs of what are the logic gates, and what they look like in Verilog
```Verilog
Some code in Verilog
```
##### Target Hardware Setup and Pin Description
> [!NOTE] - This section should link to a presentation.
> [!NOTE] - This section should have a picture showing the Gowin FPGA and GPIO module and the connections
**GPIO Module - Hardware:** discription of hardware module and pins description as it's used i this lab.  
**GPIO Module - Pin Description:**
> [!NOTE] - This should be a table of 3 columns: periferal pin, FPGA pin, Description
|   Peripheral Pin  |     FPGA Pin      |          Description                                    |
| ----------------- | ----------------- | ------------------------------------------------------- |
| Pin Name / Number | Pin Name / Number |       Short Description                                 |
| Pin Name / Number | Pin Name / Number |       Short Description                                 |
| Pin Name / Number | Pin Name / Number |       Short Description                                 |
| Pin Name / Number | Pin Name / Number |       Short Description                                 |

##### Target Software, Tools, Libraries & Drivers Setup
> [!NOTE] - This section will cover any specific software, tools, Libraries or Drivers that are used

##### Verilog Logic Gate Labs / Challenges
> [!NOTE] - This section will explain the specific Verilog Lab, what the goals are and outline the challenges.
```Verilog
Some code in Verilog
```
###### 🛠️ LAB Activity: Challenge Name #1
**Verilog Code**
Explain the challenge
```Verilog
Some code in Verilog
```
**What Success Looks Like**
describe what a successful completion of the lab looks like

###### 🛠️ LAB Activity: Challenge Name #2
**Verilog Code**
Explain the challenge
```Verilog
Some code in Verilog
```
**Running the FPGA Bash scripts**
This section will cover how and where to run the Verilog compile scripts to target the FPGA

**What Success Looks Like**
Describe what a successful completion of the lab looks like

##### Next Steps - Dig Deeper
Provide some additional resourses or assignments to look at

#### Multiplexer Verilog Code

---
### Rectangles & Circles

---
### D Flip Flop

---
### Binary Counter

---
### Shift Register

---
### Moving Rectangle

---
### Game Example

---
### Ultrasonic Distance

---
### Rotary Encoder

---
# END Of Doc  
---
Everythig below will get deleted, and was just part of the original md template  

### 1. Board Setup

![Basic Board Setup](https://github.com/verilog-meetup/verilog-hackathon-education-kit-manual/blob/main/images/basic_board_setup_1.jpg)

[Link](https://github.com/verilog-meetup/verilog-hackathon-education-kit-manual/blob/main/images/basic_board_setup_1.jpg)

### 1.1. Config your name and email

```bash
Some code in Bash
```

```Verilog
Some code in Verilog
```

1. List Item
2. List Item
3. List Item

* List Item
* List Item
* List Item

  # Jim can edit and post

Bold	**bold text**
Italic	*italicized text*

Blockquote

> blockquote
> blockquoteblockquoteblockquote
> blockquote
> blockquoteblockquoteblockquote

Horizontal Rule
---


Element	Markdown Syntax
Table

| Syntax | Description |
| ----------- | ----------- |
| Header | Title |
| Paragraph | Text |
