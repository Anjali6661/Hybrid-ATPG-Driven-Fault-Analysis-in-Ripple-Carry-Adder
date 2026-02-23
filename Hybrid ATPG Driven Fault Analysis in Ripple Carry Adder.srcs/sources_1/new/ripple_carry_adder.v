module ripple_carry_adder (
    input [3:0] A,       // 4-bit input A
    input [3:0] B,       // 4-bit input B
    input inject_fault,   // Control signal to inject fault
    input [3:0] fault_value, // Value to inject as a fault
    output [4:0] SUM      // 5-bit output (to include carry)
);
    wire [3:0] Sum;       // Sum outputs from full adders
    wire [3:0] Cout;      // Carry outputs from full adders
    wire [3:0] A_in;      // Input A with fault injection

    // Choose between original input A or the injected fault
    assign A_in = inject_fault ? fault_value : A;

    // Full adder stages
    full_adder FA0 (.A(A_in[0]), .B(B[0]), .Cin(1'b0), .Sum(Sum[0]), .Cout(Cout[0]));
    full_adder FA1 (.A(A_in[1]), .B(B[1]), .Cin(Cout[0]), .Sum(Sum[1]), .Cout(Cout[1]));
    full_adder FA2 (.A(A_in[2]), .B(B[2]), .Cin(Cout[1]), .Sum(Sum[2]), .Cout(Cout[2]));
    full_adder FA3 (.A(A_in[3]), .B(B[3]), .Cin(Cout[2]), .Sum(Sum[3]), .Cout(Cout[3]));

    assign SUM = {Cout[3], Sum};  // Final output (5 bits)
endmodule
