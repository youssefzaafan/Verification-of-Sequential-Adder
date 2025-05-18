///////////////////////////////////////////////////////////////////////////////
// File:        monitor.sv
// Author:      Youssef Zaafan Atya
// Date:        2025-05-18
// Description: uvm_monitor class
///////////////////////////////////////////////////////////////////////////////
class monitor extends uvm_monitor;
//Factory
`uvm_component_utils(monitor)
//Instances
transaction tr;
virtual add_if vif;
uvm_analysis_port #(transaction) send;
//Constructor
function new(string name = "monitor", uvm_component parent );
super.new(name, parent);
endfunction
//Build phase
function void build_phase(uvm_phase phase);
super.build_phase(phase);
send = new("send", this);
tr = transaction::type_id::create("tr",this);
//get vif
if(!uvm_config_db#(virtual add_if)::get(this,"","vif",vif))
`uvm_error ("MON", "Monitor Can't Access vif")
endfunction
//Run phase
task run_phase(uvm_phase phase);
  @(negedge vif.rst);

forever begin
    repeat(2) @(posedge vif.clk);
    tr.a = vif.a;
    tr.b = vif.b;
  	tr.y = vif.y;
  `uvm_info("MON", $sformatf("Data send to Scoreboard a : %0d , b : %0d and y : %0d", tr.a,tr.b,tr.y), UVM_NONE);

    send.write(tr);
end
endtask
endclass