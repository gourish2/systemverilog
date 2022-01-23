module d_flipflop_async_reset(
input d,clk,rst,
output logic q
);
always @ (posedge clk or negedge rst) begin
if(rst==0)
q<=0;
else
q<=d;
end
endmodule

module d_flipflop_async_reset_tb();
reg t_d,t_clk,t_rst;
wire t_q;
d_flipflop_async_reset dff(.d(t_d),.clk(t_clk),.rst(t_rst),.q(t_q));
initial begin
t_clk=0;
forever #2 t_clk=~t_clk;
end 
initial begin
$monitor("time: %0t",$time," clk: ",t_clk," rst: ",t_rst," d: ",t_d," q: ",t_q);
t_d=0;
t_rst=1;
#3 t_d=1;
#3 t_d=0;
#3 t_d=1;
#3 t_d=0;
#3 t_d=1; t_rst=0;
#3 t_d=0;
#3 $finish;
end
endmodule
