///////////////////////////////////////////////////////////////////////////////
// File:        TestBench.sv
// Author:      Youssef Zaafan Atya
// Date:        2025-05-18
// Description: Test Bench Module
///////////////////////////////////////////////////////////////////////////////
`include "pkg.sv"
module tb ()
add_if vif ();

initial begin
  vif.clk = 0;
  vif.rst = 0;
end 
//Clock Generator
forever #5 vif.clk = ~vif.clk;

add dut (.a(vif.a), .b(vif.b), .y(vif.y), .clk(vif.clk), .rst(vif.rst));

initial begin
$dumpfile("dump.vcd");
$dumpvars;
end
  
initial begin  
uvm_config_db #(virtual add_if)::set(null, "*", "vif", vif);
run_test("test");
end
endmodule