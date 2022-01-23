module ALU(
input [15:0] x,y,
output [15:0] z,
output sign, zero, parity, carry, overflow
);
assign {carry,z}=x+y;
assign sign=z[15];
assign zero=~|z;
assign parity=~^z;
assign overflow=(x[15]&y[15]&~z[15])|(~x[15]&~y[15]&z[15]);
endmodule

module alu_tb();
reg [15:0] x,y;
wire [15:0] z;
wire s,ze,p,c,of;
ALU alu(.x(x),.y(y),.z(z),.sign(s),.zero(ze),.parity(p),.carry(c),.overflow(of));
initial begin
$monitor("time: %0t, x: %h, y: %h, z: %h, sign: %b, zero: %b, parity: %b, carry: %b, overflow: %b",$time,x,y,z,s,ze,p,c,of);

x=16'h8fff; y=16'h8000;
#5 x=$urandom%65535; y=$urandom%65535;
#5 x=$urandom%65535; y=$urandom%65535;
#5 x=$urandom%65535; y=$urandom%65535;
end
endmodule
