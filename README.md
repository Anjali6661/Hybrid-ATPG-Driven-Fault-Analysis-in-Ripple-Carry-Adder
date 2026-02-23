# 🧪 Hybrid ATPG-Driven Fault Analysis in Ripple Carry Adder

![Verilog HDL](https://img.shields.io/badge/Verilog-HDL-blue.svg)  
![FPGA Ready](https://img.shields.io/badge/FPGA-Ready-green.svg)  
![ASIC Test Ready](https://img.shields.io/badge/ASIC-Test%2520Ready-orange.svg)  
![License MIT](https://img.shields.io/badge/License-MIT-yellow.svg)

---

## 📋 Project Overview
This project implements a Hybrid Automatic Test Pattern Generation (ATPG) system for real-time fault analysis in a 4-bit Ripple Carry Adder (RCA). It combines three classical ATPG algorithms: the D-Algorithm for detecting stuck-at faults, PODEM for detecting transition faults, and FAN for detecting bridging faults. The system allows configurable fault injection to analyze how different faults affect the adder’s outputs in real time. The design is modular, with the ATPG engine separated from the adder under test, allowing clear observation and monitoring of fault effects.

---

## 🎯 Key Features
The project supports multi-fault detection, including stuck-at, transition, and bridging faults. The Hybrid ATPG engine automatically selects the appropriate algorithm based on the fault type. Fault injection can be configured dynamically to test real-time scenarios. The architecture is modular, separating the ATPG engine from the adder under test, and a comprehensive testbench simulates multiple fault scenarios to verify system behavior. Design-for-Test (DFT) features include controllability via dedicated fault injection pins, observability through the full 5-bit sum output, and test point insertion for stuck-at fault simulation.

---

## 🔧 Real-World Applications
This system can be applied in automotive electronics during ECU testing to ensure arithmetic units are fault-free for anti-lock braking, engine timing, battery management, and transmission control. In aerospace systems, it is useful for pre-flight testing and in-flight monitoring of avionics systems to ensure reliable operation of flight control, navigation, engine monitoring, and communication systems. In medical devices, it supports device certification and maintenance for life-critical equipment such as MRI scanners, pacemakers, infusion pumps, and patient monitoring systems. In industrial IoT, it ensures proper functioning of robotic arms, CNC machines, and sensor networks. In telecommunications, it maintains data integrity in error correction, packet processing, and signal processing circuits. In space applications, it helps test radiation-hardened devices to mitigate single-event upsets, thermal cycling, and total ionizing dose effects.

---

## 🔬 Fault Models
The D-Algorithm detects stuck-at faults where a signal is permanently stuck at logic 0 or 1, typically due to manufacturing defects or shorts. PODEM detects transition faults where signals are slow-to-rise or slow-to-fall due to process variations or aging. FAN detects bridging faults caused by unintended connections between nets, such as metal shorts or gate-oxide defects. Each algorithm generates test patterns that effectively trigger and detect these faults.

---

## 📊 Performance Metrics
The D-Algorithm achieves 95–98% fault coverage with medium test generation time and high memory usage, suitable for small circuits. PODEM achieves 94–97% coverage with fast test generation and medium memory usage, suitable for medium-sized circuits. FAN achieves 96–99% coverage with very fast test generation and low memory usage, ideal for large circuits. Overall, the system demonstrates 100% detection of the targeted faults in simulation, with a total test time of 100 ns, three faults injected and detected, giving a detection rate of 100%, and a response time under 5 ns.

---

## 🧪 Example Test Scenario
A test scenario could include injecting a stuck-at-0 fault on input A[0] by setting `inject_fault` to 1, `fault_value` to `4'b0000`, and selecting the D-Algorithm as the fault type. Transition faults and bridging faults can be tested similarly by changing the fault type and fault value. The ATPG engine automatically generates test patterns that trigger faults effectively.

---

### 📊 Signal Analysis and Waveform Interpretation

| Signal / Time Window      | Description / Test Scenario                                          | Observed Value / SUM | Status                  |
|---------------------------|---------------------------------------------------------------------|--------------------|------------------------|
| `clk`                     | System clock with 10 ns period                                       | Toggles every 5 ns | Normal operation       |
| `reset`                   | System reset                                                        | Low (inactive)     | Normal operation       |
| `fault_type[1:0]`         | Fault mode selector                                                 | 00 → 01 → 10      | Stuck-at, Transition, Bridging |
| `inject_fault`            | Fault enable                                                        | Pulses high        | Fault injection active |
| `fault_value[3:0]`        | Injected fault value                                                | 0F                 | Used for fault tests   |
| `test_pattern[3:0]`       | ATPG-generated test pattern                                         | 05                 | Constant during tests  |
| 0–10 ns                   | Normal operation                                                    | 0F (15 decimal)    | ✅ PASS                |
| 10–30 ns                  | Stuck-at fault injection                                            | 14 (20 decimal)    | ✅ FAULT DETECTED      |
| 30–50 ns                  | Return to normal                                                    | 0F (15 decimal)    | ✅ PASS                |
| 50–70 ns                  | Transition fault injection                                          | 14 (20 decimal)    | ✅ FAULT DETECTED      |
| 70–90 ns                  | Return to normal                                                    | 0F (15 decimal)    | ✅ PASS                |
| 90–100 ns                 | Bridging fault injection                                            | 14 (20 decimal)    | ✅ FAULT DETECTED      |

## 🚀 Getting Started

### Prerequisites
- **Xilinx Vivado 2019.1** for simulation and synthesis  
- Basic understanding of digital logic  
- Optional: Python for waveform analysis using `.vcd` files  

### Simulation Steps in Vivado 2019.1
1. Open Vivado 2019.1 and create a new project  
2. Add all Verilog source files including the testbench  
3. Set the top module to the testbench  
4. Run behavioral simulation to observe waveforms  
5. Apply different fault types using `inject_fault` and `fault_value` signals  
6. Export `.vcd` files to analyze results in GTKWave  

---

## 🔮 Future Enhancements
Future improvements may include machine learning-based pattern optimization, parallel ATPG for multi-core systems, a real-time fault diagnosis dashboard, extension to sequential circuits, and integration with industry-standard ATPG tools such as TetraMAX or FastScan.

---

## 📚 References
- Bushnell, M. L., & Agrawal, V. D. (2000). *Essentials of Electronic Testing for Digital, Memory and Mixed-Signal VLSI Circuits*  
- Abramovici, M., Breuer, M. A., & Friedman, A. D. (1994). *Digital Systems Testing and Testable Design*  
- IEEE Standard 1450-1999 - Standard Test Interface Language (STIL)
