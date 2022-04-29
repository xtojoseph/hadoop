A = load '/media/sf_SharedFolder/Melbon500KB.csv'using PigStorage(',') As (Suburb:charArray,Rooms:int,Type:charArray,Price:charArray,Method:charArray,SellerG:charArray,Bedroom:charArray,Bathroom:charArray);
G = Distinct A;
STORE G into '/home/hdoop/PIG/sample/comparison/$outDir';

