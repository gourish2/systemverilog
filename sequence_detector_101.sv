module sequence_detector(
input clk,rst,in,
output reg out
);
enum {s1=32'b00,s2=32'b01,s3=32'b10,s4=32'b11} state, nextstate;

always @(state or in) begin
case(state)
s1: nextstate = in ? s2:s1;
s2: nextstate = in ? s2:s3;
s3: nextstate = in ? s4:s3;
s4: nextstate = in ? s2:s1;
endcase
end

always_ff @ (posedge clk) begin
if(rst==0)
state<=s1;
else
state<=nextstate;
end

always @ (state or in) begin
case(state)
s1: if(in==1) begin
	out=0;
	nextstate=s2;
	end
	else begin
	out=0;
	nextstate=s1;
	end
s2: if(in==1) begin
	out=0;
	nextstate=s2;
	end
	else begin
	out=0;
	nextstate=s3;
	end
s3: if(in==1) begin
	out=1;
	nextstate=s4;
	end
	else begin
	out=0;
	nextstate=s3;
	end
s4: if(in==1) begin
	out=0;
	nextstate=s2;
	end
	else begin
	out=0;
	nextstate=s3;
	end
default: nextstate=s1;
endcase
end
endmodule

module sequence_detector_tb();
reg t_clk,t_rst,t_in;
wire t_out;
sequence_detector sd(.clk(t_clk),.rst(t_rst),.in(t_in),.out(t_out));
initial begin
$display("Sequence Detector 101");
$monitor("time: %0t, clk: %b, rst: %b, in: %b, out: %b",$time,t_clk,t_rst,t_in,t_out);
t_clk=0;
t_rst=0;
t_in=0;
#3 t_rst=1;t_in=1;
#3 t_in=0;
#3 t_in=1;
#3 t_in=0;
#3 t_in=1; 
#3 t_in=0;
#3 t_in=1; 
#3 t_in=0;
#3 t_in=1; 
#3 t_in=0;
#3 t_in=1; 
#3 $finish;
end
always #1 t_clk=~t_clk;
//always #30 t_rst=~t_rst;
endmodule
