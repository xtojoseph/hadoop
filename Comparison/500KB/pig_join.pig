A = load '/media/sf_SharedFolder/Melbon500KB.csv'using PigStorage(',') As (Suburb:charArray,Rooms:int,Type:charArray,Price:charArray,Method:charArray,SellerG:charArray,Bedroom:charArray,Bathroom:charArray);
B = load '/media/sf_SharedFolder/Melbon500KB.csv'using PigStorage(',') As (Suburb:charArray,Rooms:int,Type:charArray,Price:charArray,Method:charArray,SellerG:charArray,Bedroom:charArray,Bathroom:charArray);
J = JOIN A by $0, B by $0;
H = FOREACH J GENERATE $0;
STORE H into '/home/hdoop/PIG/sample/comparison/$outDir' using PigStorage();
