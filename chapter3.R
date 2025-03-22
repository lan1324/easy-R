## 3-1 변수와 변수의 저장
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

##3-2 함수에 대하여
x<-c(1,2,3)
mean(x) ##평균을 내는 함수
## [1] 2
max(x) ##최댓값을 내는 함수
## [1] 3
min (x) ##최솟값을 내는 함수
## [1] 1

str5<-c("Hello!", "World", "is", "good")
paste (str5, collapse=",") 
##[1] "Hello!,World,is,good"

paste(str5, collapse= " ")

x_mean <-mean(x) ##새 변수에 집어넣기
str5_paste<-paste(str5,collapse=" ")
str5_paste

## 3-3 패키지 이해하기
# ggplot2 패키지 설치
install.packages("ggplot2")
library(ggplot2) ##패키지 로드
x<-c("a", "a", "b", "c")
qplot(x)

qplot(data=mpg, x=hwy) #mpg=mile for gallon, hwy=고속도로
# x축 cty
qplot(data=mpg, x=cty)
# x축drv, y축 hwy
qplot(data=mpg, x=drv, y=hwy)
# x축 drv, y축 hwy, 선 그래프
qplot(data=mpg, x=drv, y=hwy, geom="line")
# 상자 그림 형태
qplot(data=mpg, x=drv, y=hwy, geom="boxplot")
# drv별 색 표현현
qplot(data=mpg, x=drv, y=hwy, geom="boxplot", colour=drv)

#도움말 출력
?qplot

#---------------------------------------

##혼자서해보기
# Q1. 시험점수 변수 만들고 출력하기
stu_score<-c(80, 60, 70, 50, 90)
stu_score
# [1] 80 60 70 50 90

# Q2. 전체 평균 구하기
mean(stu_score)
# [1] 70

# Q3. 전체 평균 변수 만들고 출력하기
aver_score<-mean(stu_score)
aver_score
# [1] 70