///////////////////////////////////////////////////////////////////////////////
// File:        Agent.sv
// Author:      Youssef Zaafan Atya
// Date:        2025-05-18
// Description: uvm_agent class
///////////////////////////////////////////////////////////////////////////////
class agent extends uvm_agent;
// Factory
`uvm_component_utils(agent)
//Instances
driver drv;
uvm_sequencer#(transaction) seqr;
monitor mon;
// Constructor
function new(string name = "agent", uvm_component parent );
super.new(name, parent);
endfunction
//Build Phase
function void build_phase(uvm_phase phase);
super.build_phase(phase);
// Create driver, sequencer, and monitor
drv = driver::type_id::create("drv", this);
seqr = uvm_sequencer#(transaction)::type_id::create("seqr", this);
mon = monitor::type_id::create("mon", this);
endfunction
//Connect Phase
function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
// Connect driver to sequencer
drv.seq_item_port.connect(seqr.seq_item_export);
endfunction
endclass