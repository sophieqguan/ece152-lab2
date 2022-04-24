// The Four Bit Adder uses two two-bit adder to compute a four-bit sum

module fourBitAdder_TwoByTwo(A, B, cin, S, cout);
input [3:0] A, B;
input cin;
output [3:0] S;
output cout;

wire local_carry;

twoBitAdder f0(
	.A(A[1:0]),
	.B(B[1:0]),
	.cin(cin),
	.S(S[1:0]),
	.cout(local_carry));
twoBitAdder f1(
	.A(A[3:2]),
	.B(B[3:2]),
	.cin(local_carry),
	.S(S[3:2]),
	.cout(cout));

endmodule
