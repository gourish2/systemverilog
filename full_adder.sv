wq
module full_adder(
input x,y,z,
output s,
output c
);
assign s=(!x & !y & z) | (!x & y & !z) | (x & !y & !z) | (x & y & z);
assign c=x&y | y&z | x&z;
endmodule

module full_adder_tb;
reg t_x,t_y,t_z;
wire t_s,t_c;
full_adder mygate(.x(t_x),.y(t_y),.z(t_z),.s(t_s),.c(t_c));

initial 
begin
$display("\nFull_Adder => S=(!x & !y & z) | (!x & y & !z) | (x & !y & !z) | (x & y & z)  C=x&y | y&z | x&z\n");
$display("X  Y  Z => S:  C:\n");
$monitor(t_x,"  ",t_y,"  ",t_z," => S:",t_s," C: ",t_c);

t_x=1'b0;
t_y=1'b0;
t_z=1'b0;

#5
t_x=1'b0;
t_y=1'b0;
t_z=1'b1;

#5

_x=1'b0;
t_y=1'b1;
t_z=1'b0;

#5
t_x=1'b0;
t_y=1'b1;
t_z=1'b1;

#5
t_x=1'b1;
t_y=1'b0;
t_z=1'b0;

#5
t_x=1'b1;
t_y=1'b0;
t_z=1'b1;
#5
t_x=1'b1;
t_y=1'b1;
t_z=1'b0;
#5
t_x=1'b1;
t_y=1'b1;
t_z=1'b1;

end
endmodule
