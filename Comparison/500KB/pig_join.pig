A = load '/media/sf_SharedFolder/Melbon500KB.csv'using PigStorage(',') As (Suburb:charArray,Rooms:int,Type:charArray,Price:charArray,Method:charArray,SellerG:charArray,Bedroom:charArray,Bathroom:charArray);
B = load '/media/sf_SharedFolder/Melbon500KB.csv'using PigStorage(',') As (Suburb:charArray,Rooms:int,Type:charArray,Price:charArray,Method:charArray,SellerG:charArray,Bedroom:charArray,Bathroom:charArray);
J = JOIN A by $1, B by $1;
STORE J into '/home/hdoop/PIG/sample/comparison/$outDir';

