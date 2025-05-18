
# ✅ UVM Verification of a 4-bit Sequential Adder

This project demonstrates a full **Universal Verification Methodology (UVM)** testbench developed to verify the correctness of a 4-bit sequential adder using SystemVerilog. The DUT adds two 4-bit unsigned inputs and provides a 5-bit registered output.

---

## 📁 Project Structure

```
├── design.sv          // RTL: 4-bit adder module and interface
├── interface.sv       // Defines the virtual interface (add_if)
├── transaction.sv     // Defines the transaction (sequence item)
├── generator.sv       // Generates randomized stimulus
├── driver.sv          // Drives stimulus to the DUT via interface
├── monitor.sv         // Monitors DUT activity and collects transactions
├── sequencer.sv       // UVM sequencer controlling sequence flow
├── agent.sv           // UVM agent encapsulating driver, sequencer, and monitor
├── scoreboard.sv      // Compares actual vs. expected output
├── subscriber.sv      // Collects functional coverage
├── env.sv             // Instantiates agent, scoreboard, subscriber
├── test.sv            // Top-level test: configures and starts simulation
├── pkg.sv             // UVM package: includes all components
└── top.sv             // Top module for compiling and running simulation
```

---

## 🧠 Functional Coverage

Functional coverage is tracked using a covergroup defined inside a `uvm_subscriber`. It monitors inputs `a` and `b`:

```systemverilog
covergroup cg;
  cov1: coverpoint tr.a { bins a_vals[] = {[0:15]}; }
  cov2: coverpoint tr.b { bins b_vals[] = {[0:15]}; }
  ab_cross: cross cov1, cov2;
endgroup
```

Coverage is sampled during the `write()` function, and a summary is printed in the `report_phase()`.

---

## 🧪 Verification Flow

- **Driver**: Drives stimulus to DUT based on the transactions received from the sequencer.
- **Monitor**: Observes interface activity and sends collected transactions to the scoreboard and subscriber.
- **Sequencer**: Controls the order and flow of transaction generation from the generator.
- **Agent**: Combines the driver, sequencer, and monitor into one reusable verification unit.
- **Environment**: Contains the agent, scoreboard, and subscriber.
- **Subscriber**: Samples functional coverage based on observed transactions.
- **Scoreboard**: Compares actual DUT output with expected result (`y = a + b`).

---

## 🔧 Tools & Technologies

- **Language**: SystemVerilog
- **Methodology**: UVM (Universal Verification Methodology)
- **Simulator**: Synopsys VCS 2023
- **Target Design**: RTL 4-bit adder with clocked output

---

## ▶️ How to Run

1. **Compile the code:**
   ```bash
   vcs -full64 -sverilog +acc +vpi +vcs+lic+wait \
       +incdir+. *.sv -l comp.log
   ```

2. **Run the simulation:**
   ```bash
   ./simv -l sim.log
   ```

3. **Generate coverage report (optional):**
   ```bash
   urg -dir simv.vdb -full64 -format both
   ```

---

## 📊 Expected Output

- UVM reports showing:
  - Transaction values
  - Comparison results from scoreboard
  - Final coverage summary from subscriber

---

## 👨‍💻 Author

**Youssef Zaafan Atya**  
📧 Email: youssefzafan@gmail.com  
🔗 LinkedIn: [linkedin.com/in/youssef-zaafan-211482169](https://www.linkedin.com/in/youssef-zaafan-211482169)

---

## 🙋‍♂️ Contributions

Issues, forks, and pull requests are welcome. Help expand and refine this UVM project!
