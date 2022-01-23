module cover_gp_v2();
bit clk;

bit [1:0] offset;
bit [7:0] addr;
always #20 clk=~clk;

covergroup cgp @ (posedge clk);
offs: coverpoint offset
{
bins range_offset[]={[0:$]};
}
addr: coverpoint addr
{
bins range_addr[16]={[0:$]};
}
endgroup

cgp g1;

initial begin
g1=new();
end
always @(negedge clk) begin
offset=$urandom;
addr=$urandom;
g1.sample();
end

initial begin
$monitor("time: %0t, clk: %b, offset: %b, addr: %b",$time,clk,offset,addr);
#1500 $stop;
end

endmodule
