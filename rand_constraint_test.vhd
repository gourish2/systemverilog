class test;
rand bit [3:0] a,b,c,d,e,f;
randc bit [1:0] g;
constraint x{a>3;b>a;c>b;}

constraint y{d==5;}

constraint z{e inside{[11:15]};}

constraint w{f dist{4:=10, 5:=20, 6:=60};}

function string display();
        return $sformatf("a: %d, b: %d, c: %d, d: %d, e: %d, f: %d, randc: %d",a,b,c,d,e,f,g);
endfunction

endclass

module test_db;
initial begin

test my;
my=new();
for(int i=0;i<15;i++) begin
assert(my.randomize());
$display("time: %0t, iter: %d, %s",$time,i,my.display());
end

end
endmodule
