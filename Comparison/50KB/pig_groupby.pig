A = load '/media/sf_SharedFolder/Melbon50KB.csv'using PigStorage(',') As (Suburb:charArray,Rooms:int,Type:charArray,Price:charArray,Method:charArray,SellerG:charArray,Bedroom:charArray,Bathroom:charArray);
G = GROUP A by $3;
STORE G into '/home/hdoop/PIG/sample/comparison/$outDir';

