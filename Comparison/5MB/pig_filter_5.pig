A = load '/media/sf_SharedFolder/Melbon5MB.csv'using PigStorage(',') As (Suburb:charArray,Rooms:int,Type:charArray,Price:charArray,Method:charArray,SellerG:charArray,Bedroom:charArray,Bathroom:charArray);
B = FILTER A by Suburb=='Reservoir' OR Suburb=='Richmond';
STORE B into '/home/hdoop/PIG/sample/comparison/$outDir';

