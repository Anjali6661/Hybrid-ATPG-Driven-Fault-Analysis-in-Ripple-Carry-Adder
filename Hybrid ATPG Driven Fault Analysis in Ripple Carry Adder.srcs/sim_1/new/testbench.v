 module testbench;
    reg clk, reset;
    reg [1:0] fault_type;
    reg inject_fault;            // Control signal for fault injection
    reg [3:0] fault_value;       // Value to inject as a fault
    wire [3:0] test_pattern;     // Used for A input
    wire [4:0] sum;              // Output from RCA

    // Instantiate the hybrid ATPG engine
    hybrid_atpg uut_atpg (
        .clk(clk),
        .reset(reset),
        .fault_type(fault_type),
        .test_pattern(test_pattern)
    );

    // Instantiate the Ripple Carry Adder
    ripple_carry_adder uut_adder (
        .A(test_pattern),          // Input A from ATPG
        .B(4'b0101),               // Fixed value for B
        .inject_fault(inject_fault),
        .fault_value(fault_value),
        .SUM(sum)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        inject_fault = 0;          // Start without injecting faults
        fault_value = 4'b0000;     // Default fault value
        fault_type = 2'b00;        // Initialize fault_type to a known state
        
        // Apply reset
        #10 reset = 0;

        // Test for stuck-at fault on A[0]
        inject_fault = 1;            // Enable fault injection
        fault_value = 4'b0000;       // Inject stuck-at-0 on A[0]
        #10 fault_type = 2'b00;      // Stuck-at fault
        
        // Reset fault injection
        inject_fault = 0;
        #20 fault_type = 2'b01;      // Transition fault (use regular test patterns)

        // Test for bridging fault by injecting a different value
        inject_fault = 1;            // Enable fault injection
        fault_value = 4'b1111;       // Inject stuck-at-1 on A[0]
        #30 fault_type = 2'b10;      // Bridging fault

        // End simulation
        #40 $finish;
    end
endmodule
