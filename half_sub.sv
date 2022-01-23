module half_subtractor(
input x,y,
output d,
output b
);
assign d=(x & !y) | (!x & y);
assign b=!x&y;
endmodule

module half_subtractor_tb;
reg t_x,t_y;
wire t_d,t_b;
half_subtractor mygate(.x(t_x),.y(t_y),.d(t_d),.b(t_b));

initial
begin
$display("\nHalf_Subtractor => D=(x & !y) | (!x & y)  B=!x&y\n");
$display("X  Y => D:  B:\n");
$monitor(t_x,"  ",t_y," => D:",t_d," B: ",t_b);

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
