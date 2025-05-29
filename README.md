# Digital-Lock-System (3-bit Input FSM)
This project implements a **Finite State Machine (FSM)**-based digital lock using **Verilog**. The system unlocks only when a specific sequence of 3-bit binary inputs is entered in order.

## 🔧 Features
- Unlocks only on a **precise 3-input sequence**: `011 → 111 → 101`
- Resettable FSM using a `reset` signal
- `y` output (e.g., LED) goes HIGH when unlocked
- Verified with a comprehensive testbench and waveform simulation
