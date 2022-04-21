// The module "fourBitAdder FourByOne" ...
module fourBitAdder_FourByOne(A, B, cin, S, cout);
	input [3:0] A, B;
	input cin;
	output [3:0] S; 
	output cout;
	
	wire [2:0] local_carries;
	
	fullAdder f0(
		.a(A[0]),
		.b(B[0]),
		.cin(cin),
		.s(S[0]),
		.cout(local_carries[0]));

	fullAdder f1(
		.a(A[1]),
		.b(B[1]),
		.cin(local_carries[0]),
		.s(S[1]),
		.cout(local_carries[1]));	

	fullAdder f2(
		.a(A[2]),
		.b(B[2]),
		.cin(local_carries[1]),
		.s(S[2]),
		.cout(local_carries[2]));

	fullAdder f3(
		.a(A[3]),
		.b(B[3]),
		.cin(local_carries[2]),
		.s(S[3]),
		.cout(cout));
endmodule