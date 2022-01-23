module d_flipflop(
input d,clk,
output logic q
);
always_ff @(posedge clk) begin
q <= d;
end
endmodule

module d_flipflop_tb;
reg t_d,t_clk;
wire t_q;
d_flipflop dff(.d(t_d),.clk(t_clk),.q(t_q));
initial begin
$display("D Flip-flop");
$monitor("time: %0t",$time," clk: ",t_clk," d: ",t_d," => q: ",t_q);
t_clk=0;
t_d=1;
#3 t_d=1;
#3 t_d=0;
#3 t_d=1;
#3 t_d=0;
#3 $finish;
end
always #2 t_clk=~t_clk;
endmodule
