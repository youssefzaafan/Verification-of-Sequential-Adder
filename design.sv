///////////////////////////////////////////////////////////////////////////////
// File:        design.sv
// Author:      Youssef Zaafan Atya
// Date:        2025-05-18
// Description: Adder & Interface
///////////////////////////////////////////////////////////////////////////////
module add(
    input clk,rst,
    input [3:0] a,b,
    output [4:0] y
);

always @(posedge clk) begin
    if (rst) begin
        y <= 0;
    end
    else begin
        y <= a + b;
        end
end
endmodule
///////////////////////////////
interface add_if();
logic clk,rst;
logic [3:0] a,b;
logic [4:0] y;
endinterface