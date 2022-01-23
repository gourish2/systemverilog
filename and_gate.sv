module andgate(
input x,y,
output z
);
assign z=(x & y);
endmodule

module andgate_tb;
wire t_z;
reg t_x,t_y;
andgate mygate(.x(t_x),.y(t_y),.z(t_z));

initial
begin
$display("X and Y => Z");
$monitor(t_x," and ",t_y," => ",t_z);

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
