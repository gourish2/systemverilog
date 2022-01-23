module cover_gp();
bit clk;

bit [1:0] offset;
bit [7:0] addr;
always #20 clk=~clk;

covergroup cgp @ (posedge clk);
offs: coverpoint offset;
addr: coverpoint addr;
endgroup

cgp g1;

initial begin
g1=new();
for(int i=0;i<5;i++) begin
 @(negedge clk)
offset=$urandom;
addr=$urandom;
g1.sample();
end
end

initial begin
$monitor("time: %0t, clk: %b, offset: %b, addr: %b",$time,clk,offset,addr);
#200 $stop;
end

endmodule

