module full_adder (
    input A,        // First input
    input B,        // Second input
    input Cin,     // Carry input
    output Sum,    // Sum output
    output Cout    // Carry output
);
    assign Sum = A ^ B ^ Cin;     // Sum calculation
    assign Cout = (A & B) | (Cin & (A ^ B)); // Carry calculation
endmodule
