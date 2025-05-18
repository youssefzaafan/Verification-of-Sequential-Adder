///////////////////////////////////////////////////////////////////////////////
// File:        transaction.sv
// Author:      Youssef Zaafan Atya
// Date:        2025-05-18
// Description: uvm_sequence_item class
///////////////////////////////////////////////////////////////////////////////
class transaction extends uvm_sequence_item;
//Factroy
`uvm_object_utils(transaction)
//Fields
rand bit[3:0] a;
rand bit[3:0] b;
     bit[4:0] y;
//Constructor 
function new(string name = "transaction");
super.new(name);
endfunction

//Do_copy Func
  function void do_copy(uvm_object rhs);
    transaction rhs_;
    if (!$cast(rhs_, rhs))
      `uvm_fatal("COPY", "Failed to cast rhs");
    a = rhs_.a;
    b = rhs_.b;
    y = rhs_.y;
  endfunction

//Convert2string
  function string convert2string();
    return $sformatf("a=%0d b=%0d c=%0d", a, b, y);
  endfunction


//Constrains

endclass