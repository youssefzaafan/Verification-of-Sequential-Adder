///////////////////////////////////////////////////////////////////////////////
// File:        driver.sv
// Author:      Youssef Zaafan Atya
// Date:        2025-05-18
// Description: uvm_driver class
///////////////////////////////////////////////////////////////////////////////
class driver extends uvm_driver#(transaction);
//Factory
`uvm_component_utils(driver)
//Instances
transaction tr;
virtual add_if vif;

//Constructor
function new(string name = "driver", uvm_component parent );
super.new(name, parent);
endfunction

//Build_phase
function void build_phase(uvm_phase phase);
super.build_phase(phase);
tr = transaction::type_id::create("tr", this);
//get the interface
if(!uvm_config_db#(virtual add_if)::get(this, "", "vif",vif))
`uvm_error("DRV", "Driver Can't access vif")
endfunction
//Reset task
task reset_dut();
aif.rst <= 1'b1;
    aif.a   <= 0;
    aif.b   <= 0;
    repeat(5) @(posedge vif.clk);
    aif.rst <= 1'b0; 
    `uvm_info("DRV", "Reset Done", UVM_NONE);
endtask


//Run Phase
task run_phase(uvm_phase phase);
reset_dut();
forever begin
    seq_item_port.get_next_item(tr);
    vif.a = tr.a;
    vif.b = tr.b;
    seq_item_port.item_done(); 
    `uvm_info("DRV", $sformatf("Trigger DUT a: %0d ,b :  %0d",tr.a, tr.b), UVM_NONE); 
    repeat(2) @(posedge vif.clk);

end
endtask
endclass