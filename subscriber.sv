///////////////////////////////////////////////////////////////////////////////
// File:        Subscriber.sv
// Author:      Youssef Zaafan Atya
// Date:        2025-05-19
// Description: uvm_subscriber class
///////////////////////////////////////////////////////////////////////////////
class subscriber extends uvm_subscriber #(transaction);
//Factory
`uvm_component_utils(subscriber)
//Instances
transaction tr;
real cov;
//Covergrop
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

//Constructor
function new(string name = "subscriber", uvm_component parent = null);
super.new(name, parent);
cg = new();
endfunction
//Write
function void write(transaction t);
tr = t;
cg.sample();
endfunction
  //----------------------------------------------------------------------------
  function void extract_phase(uvm_phase phase);
    super.extract_phase(phase);
    cov=cg.get_coverage();
  endfunction
  //----------------------------------------------------------------------------


  //----------------------------------------------------------------------------
  function void report_phase(uvm_phase phase);
    super.report_phase(phase);
    `uvm_info(get_type_name(),$sformatf("Functional Coverage is %f",cov),UVM_LOW)
  endfunction
endclass

