class zebra;
typedef enum {red,green,ivory,yellow,blue} house_color;
typedef enum {englishman,spaniard,ukrainian,norwegian,japanese} owner_nationality;
typedef enum {dog,snails,fox,horse,zebra} house_pet;
typedef enum {coffee,tea,milk,orange_juice,water} drink;
typedef enum {old_gold,kools,chasterfield,lucky_strike,parliaments} smoke;

rand house_color my_house_color[5];
rand owner_nationality my_owner[5];
rand house_pet my_house_pet[5];
rand drink my_drink[5];
rand smoke my_smoke[5];

constraint each_unique{unique{my_house_color};unique{my_owner};unique{my_house_pet};unique{my_drink};unique{my_smoke};}

//the englishman lives in red house
constraint c_1{foreach(my_owner[i]) if(my_owner[i]==englishman) my_house_color[i]==red;}

//the spaniard owns a dog
constraint c_2{foreach(my_owner[i]) if(my_owner[i]==spaniard) my_house_pet[i]==dog;}

//coffee is drunk in green house
constraint c_3{foreach(my_drink[i]) if(my_drink[i]==coffee) my_house_color[i]==green;}

//the ukranian drinks tea
constraint c_4{foreach(my_owner[i]) if(my_owner[i]==ukrainian) my_drink[i]==tea;}

//The green house is immediately to the right of the ivory house.
constraint c_5{foreach(my_house_color[i]) if(i<4 && my_house_color[i]==ivory) my_house_color[i+1]==green;
						else my_house_color[i]!=ivory;}

//The Old Gold smoker owns snails.
constraint c_6{foreach(my_smoke[i]) if(my_smoke[i]==old_gold) my_house_pet[i]==snails;}

//Kools are smoked in the yellow house.
constraint c_7{foreach(my_smoke[i]) if(my_smoke[i]==kools) my_house_color[i]==yellow;}

//Milk is drunk in the middle house.
constraint c_8{my_drink[2]==milk;}

//The Norwegian lives in the first house.
constraint c_9{my_owner[0]==norwegian;}

//The man who smokes Chesterfields lives in the house next to the man with the fox.
constraint c_10{foreach(my_house_pet[i]) if(my_house_pet[i]==fox) 
				        if(i==0) my_smoke[i+1]==chasterfield;
					else if(i>0 && i<4) my_smoke[i-1]==chasterfield || my_smoke[i+1]==chasterfield;
					else if(i==4) my_smoke[i-1]==chasterfield;
					}

//Kools are smoked in the house next to the house where the horse is kept.
constraint c_11{foreach(my_house_pet[i]) if(my_house_pet[i]==horse)         
                                        if(i==0) my_smoke[i+1]==kools;
                                        else if(i>0 && i<4) my_smoke[i-1]==kools || my_smoke[i+1]==kools;
                                        else if(i==4) my_smoke[i-1]==kools;
                                        }


//The Lucky Strike smoker drinks orange juice.
constraint c_12{foreach(my_smoke[i]) if(my_smoke[i]==lucky_strike) my_drink[i]==orange_juice;}

//The Japanese smokes Parliaments.
constraint c_13{foreach(my_owner[i]) if(my_owner[i]==japanese) my_smoke[i]==parliaments;}

//The Norwegian lives next to the blue house.
constraint c_14{foreach(my_house_color[i]) if(my_house_color[i]==blue)
                                       if(i==0) my_owner[i+1]==norwegian;
                                       else if(i>0 && i<4) my_owner[i-1]==norwegian || my_owner[i+1]==norwegian;
                                       else if(i==4) my_owner[i-1]==norwegian;
                                       }

function void display();
$display("House owner nationality: %p",my_owner);
$display("House color            : %p",my_house_color);
$display("House pet              : %p",my_house_pet);
$display("Drink                  : %p",my_drink);
$display("Smoke                  : %p",my_smoke);
endfunction

endclass

                                                                                                                                                  
module test;
initial begin

zebra my;
my=new();
//for(int i=0;i<10;i++) begin
assert(my.randomize());
//$display("i:%d",i);
my.display();
//end

end
endmodule
