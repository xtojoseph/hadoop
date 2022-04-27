A = load '/media/sf_SharedFolder/Melbon50KB.csv'using PigStorage(',') As (Suburb:charArray,Rooms:int,Type:charArray,Price:charArray,Method:charArray,SellerG:charArray,Bedroom:charArray,Bathroom:charArray);
result = FOREACH A Generate  $1+$1 as sum;
STORE result into '/home/hdoop/PIG/sample/comparison/$outDir';

