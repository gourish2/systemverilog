module mux_2x1(
input a,b,sel,
output f
);
assign f=sel ? b:a;
endmodule

module mux_2x1_tb;
reg t_a,t_b,t_sel;
wire t_f;
mux_2x1 mux_(.a(t_a),.b(t_b),.sel(t_sel),.f(t_f));

initial begin
$display("2x1 Mux");
$display("sel a b => f");
$monitor(t_sel," ",t_a," ",t_b," => ",t_f);

t_sel=0, a=0, b=0;

#5
t_sel=0, a=0, b=1;

#5
t_sel=0, a=1, b=0;

#5
t_sel=0, a=1, b=1;

#5
t_sel=1, a=0, b=0;

#5
t_sel=1, a=0, b=1;

#5
t_sel=1, a=1, b=0;

#5
t_sel=1, a=1, b=1;

end
endmodule
