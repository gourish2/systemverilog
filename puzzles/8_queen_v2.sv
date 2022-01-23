class queen;
rand bit[8] q[8];

constraint count_queens{foreach(q[j]) $countones(q[j])==1;}

constraint distinct{foreach(q[i]) foreach(q[j]) if(i!=j) q[i]!=q[j];}

constraint left{foreach(q[i]) foreach(q[j]) if(i!=j) (q[i]/q[j])!=2**(i>j?(i-j):(j-i));}

function void display();

foreach(q[i])
$display("%b ",q[i]);

endfunction

endclass

module test_db;
initial begin

queen my;
my=new();
for(int i=0;i<15;i++) begin
assert(my.randomize());
$display("time: %0t, iter: %d",$time,i);
my.display();
end

end
endmodule
