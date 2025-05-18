///////////////////////////////////////////////////////////////////////////////
// File:        generator.sv
// Author:      Youssef Zaafan Atya
// Date:        2025-05-18
// Description: uvm_sequence class
///////////////////////////////////////////////////////////////////////////////
class generator extends uvm_sequence #(transaction);
//Factory
`uvm_object_utils(generator)
//Constructor
function new(string name = "generator");
super.new(name);
endfunction
//Instance
transaction tr;
//Pre_Body
task pre_body();
tr = transaction::type_id::create("tr");
endtask
//Method to start the sequence
task body();
  repeat(40) begin
    start_item(tr);
    assert(tr.randomize());
    finish_item(tr);
end
endtask
endclass