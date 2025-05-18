///////////////////////////////////////////////////////////////////////////////
// File:        Scoreboard.sv
// Author:      Youssef Zaafan Atya
// Date:        2025-05-18
// Description: uvm_scoreboard class
///////////////////////////////////////////////////////////////////////////////
class scoreboard extends uvm_scoreboard;
//Factory
`uvm_component_utils(scoreboard)
//Instances
uvm_analysis_imp#(transaction,scoreboard) recv;
transaction tr;

//Constructor
function new(string name = "scoreboard", uvm_component parent = null);
super.new(name,parent);
recv = new("recv",this);
endfunction
//Build Phase
function void build_phase(uvm_phase phase);
super.build_phase(phase);
tr = transaction::type_id::create("tr",this);
endfunction

//Algorthim to check if the transaction is correct
function void write(transaction tr);
  `uvm_info("SCO",$sformatf("Data rcvd from Monitor a: %0d , b : %0d and y : %0d",tr.a,tr.b,tr.y), UVM_NONE);
//Check if the transaction is correct
if(tr.a + tr.b == tr.y)
  `uvm_info ("SCO","Transaction is correct",UVM_NONE)
else
  `uvm_info ("SCO","Transaction is incorrect",UVM_NONE)

$display("----------------------------------------------------------------");
endfunction
endclass