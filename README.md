# Bidirectional Shift Register (4-bit)

This project implements a 4-bit Bidirectional Shift Register using both **Logisim** (for circuit-level simulation) and **Verilog HDL** (for RTL simulation using **Vivado**). The register supports both left and right shifts and includes reset functionality.

## 🔧 Features

- **4-bit width** shift register.
- Supports **left** and **right** shifting.
- Separate **serial inputs** for left and right shift operations.
- **Synchronous reset** to clear the register.
- Implemented in both **Logisim** and **Verilog**.

## 📁 Files

### Verilog Source

- `bidirectional_shift_register.v` – Main design module.
- `tb_bidirectional_shift_register.v` – Testbench for simulation and verification.

### Logisim

- `bidirectional_shift_register.circ` – Logisim circuit design and simulation file.

## 📽️ Simulation

The Verilog testbench (`tb_bidirectional_shift_register.v`) verifies the following:

1. **Reset functionality** – Clears the register to `0000`.
2. **Left shift** – Shifts the bits to the left while taking `serial_in_left` input into LSB.
3. **Right shift** – Shifts the bits to the right while taking `serial_in_right` input into MSB.

**Simulation waveform** can be generated in Vivado using the testbench. You can monitor the changes using `$monitor` in the terminal or with GTKWave (if exported from Vivado).

## 🧠 Logic Description
On rising edge of the clock:
- If reset is active:
Set register to 0000
- Else if shift_left is active:
Shift bits left and insert serial_in_left at LSB
- Else if shift_right is active:
Shift bits right and insert serial_in_right at MSB


## 🛠 Tools Used

- **Logisim Evolution** (for schematic-level simulation)
- **Vivado 2020.2** (or any recent version)
- **Verilog HDL**
- **GTKWave** (optional, for waveform analysis)

## 🧪 How to Run

### Logisim:
1. Open `bidirectional_shift_register.circ` in Logisim Evolution.
2. Trigger clock manually or using a clock component.
3. Toggle control and serial input lines to simulate.

### Vivado:
1. Create a new Vivado project and add `bidirectional_shift_register.v` and `tb_bidirectional_shift_register.v`.
2. Set the testbench as the top module for simulation.
3. Run simulation to verify behavior.

## 📸 Screenshots

> You can add waveform screenshots or Logisim circuit images here.

## 🤝 Contribution

Feel free to fork this repository and enhance it — such as:
- Expanding to 8-bit or 16-bit registers.
- Adding parallel load functionality.
- Implementing in SystemVerilog with assertions.

## 📜 License

This project is open-source and available under the [MIT License](LICENSE).

## 🙋‍♂️ Author

Sarthak Aggarwal  
ECE, DTU — Passionate about VLSI, Memory Design, and System Architecture  
📧 sarthakaggarwal30102003@gmail.com  
🔗 [LinkedIn](https://www.linkedin.com/in/your-profile/)


