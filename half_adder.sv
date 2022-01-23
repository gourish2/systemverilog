module half_adder(
input x,y,
output s,
output c
);
assign s=(x | y) & (!x | !y);
assign c=x&y;
endmodule

module half_adder_tb;
reg t_x,t_y;
wire t_s,t_c;
half_adder mygate(.x(t_x),.y(t_y),.s(t_s),.c(t_c));

initial
begin
$display("\nHalf_Adder => S=((x | y) & (!x | !y))  C=xy\n");
$display("X  Y => S:  C:\n");
$monitor(t_x,"  ",t_y," => S:",t_s," C: ",t_c);

t_x=1'b0;
t_y=1'b0;

#5
t_x=1'b0;
t_y=1'b1;

#5
t_x=1'b1;
t_y=1'b0;

#5
t_x=1'b1;
t_y=1'b1;

end
endmodule
