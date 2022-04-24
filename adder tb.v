

// Tests the implementations
module adder__full_tb;
wire [3:0] A, B;
wire cin;
wire [3:0] S0, S1;
wire cout0, cout1;
	
fourBitAdder_FourByOne f0(
.A(A),
.B(B),
.cin(cin),
.S(S0),
.cout(cout0));

fourBitAdder_TwoByTwo f1(
.A(A),
.B(B),
.cin(cin),
.S(S1),
.cout(cout1));

reg [8:0] all_input;
assign {A, B, cin} = all_input;

integer i;

wire [4:0] expected_output, parity_sum0, parity_sum1;
wire parity_check1, parity_check0;
assign parity_sum0 = expected_output - {cout0, S0};
assign parity_sum1 = expected_output - {cout1, S1};

assign parity_check0 = |parity_sum0;
assign parity_check1 = |parity_sum1;

assign expected_output = A + B + cin;
initial begin
for (i = 0; i < 512; i = i + 1)
begin
	all_input <= i;
	#10;
end
end
endmodule
