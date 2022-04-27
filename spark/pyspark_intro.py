#Count number of occurrences
file = sc.textFile('/home/hdoop/sample.txt')

mp = file.map(lambda x:x.split(" "))
fmp = file.flatMap(lambda x:x.split(" "))

result = file.flatMap(lambda x:x.split(" ")).map(lambda w: (w,1)).reduceByKey(lambda x,y : x+y)


#Total sales per customer
sd = spark.read.option("inferSchema", "true").option("header", "true").csv("/home/hdoop/PIG/sample/sample.txt")
sd.printSchema()
ts = sd.groupBy("Customer").sum("Qty")
print(ts.collect())

#Rename and Sort the above result
import pyspark.sql.functions import desc
result = ts.sort(desc("Total"))
print(result.collect())



