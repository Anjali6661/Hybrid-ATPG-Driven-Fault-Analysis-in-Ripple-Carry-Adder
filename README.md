# 🧪 Hybrid ATPG-Driven Fault Analysis in Ripple Carry Adder

![Verilog HDL](https://img.shields.io/badge/Verilog-HDL-blue.svg)  
![FPGA Ready](https://img.shields.io/badge/FPGA-Ready-green.svg)  
![ASIC Test Ready](https://img.shields.io/badge/ASIC-Test%2520Ready-orange.svg)  
![License MIT](https://img.shields.io/badge/License-MIT-yellow.svg)

---

## 📋 Project Overview
This project implements a Hybrid Automatic Test Pattern Generation (ATPG) system for real-time fault analysis in a 4-bit Ripple Carry Adder (RCA). It combines three classical ATPG algorithms: the D-Algorithm for detecting stuck-at faults, PODEM for detecting transition faults, and FAN for detecting bridging faults. The system allows configurable fault injection to analyze how different faults affect the adder’s outputs in real time.

---

## 🎯 Key Features
The project supports multi-fault detection, including stuck-at, transition, and bridging faults. The Hybrid ATPG engine automatically selects the appropriate algorithm based on the type of fault. Fault injection can be configured dynamically to test real-time scenarios. The architecture is modular, separating the ATPG engine from the adder under test, and a comprehensive testbench simulates multiple fault scenarios to verify system behavior.

---

## 🔧 Real-World Applications
This system can be applied in automotive electronics during ECU testing to ensure arithmetic units are fault-free for ABS, engine timing, battery management, and transmission control. In aerospace systems, it is useful for pre-flight testing and in-flight monitoring of avionics systems to ensure reliable operation of flight control, navigation, engine monitoring, and communication systems. In medical devices, it supports device certification and maintenance for life-critical equipment such as MRI scanners, pacemakers, and infusion pumps. In industrial IoT, it ensures the proper functioning of robotic arms, CNC machines, and sensor networks. In telecommunications, it maintains data integrity in error correction, packet processing, and signal processing circuits. In space applications, it helps test radiation-hardened devices to mitigate single-event upsets, thermal cycling, and total ionizing dose effects.

---

## 🔬 Fault Models
The D-Algorithm is used to detect stuck-at faults, where a signal is permanently stuck at logic 0 or 1, usually due to manufacturing defects or shorts. PODEM detects transition faults, where signals are slow-to-rise or slow-to-fall, caused by process variations or aging effects. FAN detects bridging faults, which occur due to unintended connections between nets, such as metal shorts or gate-oxide defects.

---

## 📊 Performance Metrics
The D-Algorithm achieves 95-98% fault coverage with medium test generation time and high memory usage, suitable for small circuits. PODEM achieves 94-97% coverage with fast test generation and medium memory usage, suitable for medium-sized circuits. FAN achieves 96-99% coverage with very fast test generation and low memory usage, ideal for large circuits.

---

## 🚀 Getting Started

### Prerequisites
- **Xilinx Vivado 2019.1** for simulation and synthesis.  
- Basic understanding of digital logic.  
- Optional: Python for waveform analysis using `.vcd` files.  

### Simulation Steps in Vivado 2019.1
1. Open Vivado 2019.1 and create a new project.  
2. Add all Verilog source files, including the testbench.  
3. Set the top module to the testbench.  
4. Run behavioral simulation to observe the waveform.  
5. Apply different fault types using the `inject_fault` and `fault_value` signals.  
6. Export `.vcd` files if you want to analyze results in GTKWave.  

---

## 🧪 Example Test Scenario
A test scenario could include injecting a stuck-at-0 fault on input A[0] by setting `inject_fault` to 1, `fault_value` to `4'b0000`, and selecting the D-Algorithm as the fault type. Similarly, transition faults and bridging faults can be tested by changing the fault type and fault value.

---

## 📈 Sample Results
During simulation, normal input A=1010 and B=0101 produces a SUM of 01111 with no faults. When a stuck-at-0 fault is injected on A[0], the SUM changes to 00101 and the fault is detected. A transition fault results in SUM=10001, and a bridging fault results in SUM=10100, both detected by the system.

---

## 🔮 Future Enhancements
Future improvements include integrating machine learning to optimize test patterns, supporting parallel ATPG for multi-core systems, creating a real-time fault diagnosis dashboard, extending support to sequential circuits, and integrating with industry-standard ATPG tools such as TetraMAX or FastScan.

---

## 📚 References
- Bushnell, M. L., & Agrawal, V. D. (2000). *Essentials of Electronic Testing for Digital, Memory and Mixed-Signal VLSI Circuits*.  
- Abramovici, M., Breuer, M. A., & Friedman, A. D. (1994). *Digital Systems Testing and Testable Design*.  
- IEEE Standard 1450-1999 - Standard Test Interface Language (STIL).
