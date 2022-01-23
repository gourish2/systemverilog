module d_flipflop_sync_reset(
input d,clk,rst,
output logic q
);
always @ (posedge clk) begin
if(rst==0)
q<=0;
else
q<=d;
end
endmodule

module d_flipflop_sync_reset_tb();
reg t_d,t_clk,t_rst;
wire t_q;
d_flipflop_async_reset dff(.d(t_d),.clk(t_clk),.rst(t_rst),.q(t_q));
initial begin
$monitor("time: %0t",$time," clk: ",t_clk," rst: ",t_rst," d: ",t_d," q: ",t_q);
t_d=0;
t_clk=1;
t_rst=1;
#3 t_d=1;
#3 t_d=0;
#3 t_d=1;
#3 t_d=0;
#3 t_d=1;
#3 t_d=0;
#3 $finish;
end
always #2 t_clk=~t_clk;
always #10 t_rst=~t_rst;
endmodule
