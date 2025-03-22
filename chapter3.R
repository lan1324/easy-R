## 3-2 변수와 변수의 저장
a<-1  ##변수에 숫자저장
b<-2
a+b

str1<-"a" ##변수에 문자 저장
str2<-"Hello World!"
str1
str2

var1<-c(1,2,5,7,8) ##변수에 여러개의 숫자 저장
var2<-c(1:5)
var3<-seq(1,5)
var4<-seq(1,10, by=2)
var1
var2
var3
var4
var1+2 ## 변수에 수를 더할 수 있음
var1+var2 ##변수끼리의 연산도 가능

str4<-c("apple", "banana", "carrot") ##숫자 외에 여러개의 문자도 저장가능
str5<-c("a", "b", "c")
str4
str5
str4+str5 ##단 문자 변수는 계산이 되지 않는다


