///////////////////////////////////////////////////////////////////////////////
// File:        Test.sv
// Author:      Youssef Zaafan Atya
// Date:        2025-05-18
// Description: uvm_test class
///////////////////////////////////////////////////////////////////////////////
class test extends uvm_test;
//Factory
`uvm_component_utils(test)
//Instances
env env_h;
transaction tr;
virtual add_if vif;
//Constructor
function new(string name = "test", uvm_component parent );
super.new(name, parent);
endfunction
//Build phase
function void build_phase(uvm_phase phase);
super.build_phase(phase);
//Create the environment
env_h = env::type_id::create("env_h", this);
//Create the transaction
tr = transaction::type_id::create("tr", this);
//Get the virtual interface
  if(!uvm_config_db#(virtual add_if)::get(this,"","vif",vif))
`uvm_error("TEST","Test Can't access vif")
endfunction
//Run phase
task run_phase(uvm_phase phase);
phase.raise_objection(this);
//Send the transaction
tr.start(env_h.ag.seqr);
//Release the objection
phase.drop_objection(this);
endtask
endclass


