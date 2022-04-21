
module twoBitAdder(A, B, cin, S, cout);
input [1:0] A;
input [1:0] B;
input cin;
output [1:0] S;
output cout;

wire c1;

fullAdder f0 (A[0], B[0], cin, S[0], c1);
fullAdder f1 (A[1], B[1], c1, S[1], cout);

endmodule