
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
covergroup cg @(tr);

    cov_a: coverpoint tr.a {
      bins low     = {[0:3]};
      bins mid     = {[4:11]};
      bins high    = {[12:15]};
    }

    cov_b: coverpoint tr.b {
      bins low     = {[0:3]};
      bins mid     = {[4:11]};
      bins high    = {[12:15]};
    }

    ab_cross: cross cov_a, cov_b;  
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
- **Simulator**: Adlec Riviera Pro 2023.04
- **Target Design**: RTL 4-bit adder with clocked output

---

## ▶️ How to Run

[EDA Playground link](https://edaplayground.com/x/T5Kc) 

## 📊 Expected Output

- UVM reports showing:
  
```systemverilog
# KERNEL: UVM_INFO /home/runner/driver.sv(46) @ 825: uvm_test_top.env.ag.drv [DRV] Trigger DUT a: 11 ,b :  7
# KERNEL: UVM_INFO /home/runner/monitor.sv(35) @ 845: uvm_test_top.env.ag.mon [MON] Data send to Scoreboard a : 11 , b : 7 and y : 18
# KERNEL: UVM_INFO /home/runner/scoreboard.sv(27) @ 845: uvm_test_top.env.scb [SCO] Data rcvd from Monitor a: 11 , b : 7 and y : 18
# KERNEL: UVM_INFO /home/runner/scoreboard.sv(30) @ 845: uvm_test_top.env.scb [SCO] Transaction is correct
# KERNEL: ----------------------------------------------------------------
# KERNEL: UVM_INFO /home/build/vlib1/vlib/uvm-1.2/src/base/uvm_objection.svh(1271) @ 845: reporter [TEST_DONE] 'run' phase is ready to proceed to the 'extract' phase
# KERNEL: UVM_INFO /home/runner/subscriber.sv(52) @ 845: uvm_test_top.env.sub [subscriber] Functional Coverage is 100.000000
# KERNEL: UVM_INFO /home/build/vlib1/vlib/uvm-1.2/src/base/uvm_report_server.svh(869) @ 845: reporter [UVM/REPORT/SERVER] 
# KERNEL: --- UVM Report Summary ---
# KERNEL: 
# KERNEL: ** Report counts by severity
# KERNEL: UVM_INFO :  165
# KERNEL: UVM_WARNING :    0
# KERNEL: UVM_ERROR :    0
# KERNEL: UVM_FATAL :    0
# KERNEL: ** Report counts by id
# KERNEL: [DRV]    41
# KERNEL: [MON]    40
# KERNEL: [RNTST]     1
# KERNEL: [SCO]    80
# KERNEL: [TEST_DONE]     1
# KERNEL: [UVM/RELNOTES]     1
# KERNEL: [subscriber]     1
```

---

## 👨‍💻 Author

**Youssef Zaafan Atya**  
📧 Email: youssefzafan@gmail.com  
🔗 LinkedIn: [linkedin.com/in/youssef-zaafan-211482169](https://www.linkedin.com/in/youssef-zaafan-211482169)

