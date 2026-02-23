🔬 Hybrid ATPG Driven Fault Analysis in Ripple Carry Adder
A VLSI testing project that implements Hybrid Automatic Test Pattern Generation (ATPG) to detect Stuck-at, Transition, and Bridging faults in a 4-bit Ripple Carry Adder using D-Algorithm, PODEM, and FAN algorithms.

📋 Project Overview
This project implements a Hybrid Automatic Test Pattern Generation (ATPG) system for fault detection in digital circuits. It combines three classical ATPG algorithms to detect different types of faults in a 4-bit Ripple Carry Adder.

Key Features
✅ Multi-fault detection (Stuck-at, Transition, Bridging)

✅ Real-time fault injection

✅ Waveform analysis

✅ Design for Testability (DFT) architecture

🔧 Design for Testability (DFT) Features
This project incorporates fundamental DFT principles to enhance fault detection and testability:

1. Controllability
Dedicated fault injection pins for direct control of internal nodes

ATPG engine provides controllable test patterns

Algorithm selector for different fault scenarios

2. Observability
Full 5-bit sum output for complete result observation

Waveform dump (VCD) for detailed signal analysis

Real-time fault detection monitoring

3. Test Point Insertion
Fault multiplexer at each input bit for stuck-at fault simulation

Scan-like access to internal carry signals

Bypass paths for direct fault injection

🏗️ Architecture with DFT
Top-Level Modules with DFT Enhancements
🔹 Ripple Carry Adder (with fault injection DFT)
Input multiplexers for stuck-at fault simulation

Observable internal carry chain

Test mode selector

🔹 Hybrid ATPG Engine (test pattern generator)
Algorithm selection for different fault models

Pattern generation based on DFT requirements

🔹 Testbench (test application and response monitoring)
Fault injection control

Response analysis

Coverage calculation

Module Descriptions
Module	Description	DFT Features
full_adder.v	Basic 1-bit adder building block	Complete observability of Sum and Carry, No internal nodes (fully controllable/observable)
ripple_carry_adder.v	4-bit adder with DFT structures	Fault injection multiplexers (controllability), Carry chain observable (observability), Test mode input
hybrid_atpg.v	Test pattern generator with DFT awareness	Algorithm selection based on fault models, Pattern generation optimized for DFT structures
testbench.v	DFT verification environment	Tests all fault models, Verifies controllability and observability, Measures fault coverage
🚀 Getting Started
Software Required
Vivado 2019.1 (for simulation and synthesis)

How to Run
Open Vivado 2019.1

Create a new project

Add all source files (full_adder.v, ripple_carry_adder.v, hybrid_atpg.v, testbench.v)

Run simulation

View waveforms to analyze fault detection

Check fault coverage reports
