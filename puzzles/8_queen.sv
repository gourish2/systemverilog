class queen;
rand int q[8];

constraint count_queens{foreach(q[i]) q[i] inside {[1:8]};}

constraint distinct{foreach(q[i]) foreach(q[j]) if(i!=j) q[i]!=q[j];}

constraint left{foreach(q[i]) foreach(q[j]) if(i!=j) (q[i]-q[j])!=(i-j);}

constraint right{foreach(q[i]) foreach(q[j]) if(i!=j) (q[i]-q[j])!=(j-i);}

function void display();
$display("%p ",q);

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
