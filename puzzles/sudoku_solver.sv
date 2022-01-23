class sudoku;
rand int grid[9][9];
int to_solve[9][9];

constraint each_ele{foreach(grid[i,j]) grid[i][j] inside {[1:9]};}

constraint check_col{foreach(grid[i,j]) foreach(grid[a,j]) if(i!=a) grid[i][j]!=grid[a][j];}

constraint check_row{foreach(grid[i,j]) foreach(grid[i,b]) if(j!=b) grid[i][j]!=grid[i][b];}

constraint subgrid{foreach(grid[i,j]) foreach(grid[w,k]) if((i!=w && j!=k) && i/3==w/3 && j/3==k/3) grid[i][j]!=grid[w][k];}

constraint copy{foreach(to_solve[i,j]) if(to_solve[i][j]!=0) grid[i][j]==to_solve[i][j];}


function void display();
foreach(grid[i])
$display("%p ",grid[i]);
endfunction
endclass

module test;
//int me[9][9];
initial begin
/*static int me[9][9]='{  '{5,3,0,0,7,0,0,0,0},
			'{6,0,0,1,9,5,0,0,0},
			'{0,9,8,0,0,0,0,6,0},
			'{8,0,0,0,6,0,0,0,3},
			'{4,0,0,8,0,3,0,0,1},
			'{7,0,0,0,2,0,0,0,6},
			'{0,6,0,0,0,0,2,8,0},
			'{0,0,0,4,1,9,0,0,5},
			'{0,0,0,0,8,0,0,7,9}};
*/
static int me[9][9]='{  '{0,0,0,0,0,0,8,0,0},
                        '{0,4,6,1,0,0,0,0,0},
                        '{0,0,5,3,0,8,0,0,0},
                        '{9,0,0,4,0,0,7,0,3},
                        '{0,2,0,0,0,0,0,9,4},
                        '{3,0,0,0,0,0,6,0,0},
                        '{0,0,0,5,0,0,0,0,0},
                        '{0,0,8,0,0,0,3,0,1},
                        '{0,0,0,0,2,7,0,0,0}};


sudoku my;
my=new();
my.to_solve=me;
assert(my.randomize());
my.display();


end
endmodule
