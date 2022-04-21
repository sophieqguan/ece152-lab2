
// The full adder takes two bits and one carry-in bit as inputs
// and computes the sum ...
module fullAdder(a, b, cin, s, cout);
	input wire a, b, cin;
	output wire s, cout;

	assign s  = (a & b & cin) | (a & ~b & ~cin) | (~a & ~b & cin) | (~a & b & ~cin);

	assign cout = (a & b) | (b & cin) | (cin & a);
endmodule