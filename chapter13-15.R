##chapter 13 통계 분석 기법을 이용한 가설 검정
##--------------chatper 13-2 검정 - 두 집단의 평균 비교
mpg <- as.data.frame(ggplot2::mpg)
library(dplyr)
mpg_diff <- mpg %>%
  select(class, cty) %>% ##class, cty변수만 남기고
  filter(class %in% c("compact", "suv")) ##class 변수가 compact, suv추출

head(mpg_diff)
table(mpg_diff$class)
## compact     suv 
## 47      62 

t.test(data=mpg_diff, cty ~ class, var.equal = T) 
## ~를 통해비교할 값인 cty와 비교할 집단인 class 변수를 지정, 분산이 같다고 가정해 T
## p-value < 2.2e-16
## mean in group compact     mean in group suv 
## 20.12766              13.50000 
## p-value가 유의확률을 뜻함 0.05미만이면 차이가 통계적으로 유의미
## compact는 20이고 suv는 13이니 compact의 연비가 더 높음

mpg_diff2 <- mpg %>%
  select(fl, cty) %>%
  filter(fl %in% c("r", "p")) ##regular, premium
table(mpg_diff2$fl)
##   p   r 
## 52 168 

t.test(data=mpg_diff2, cty ~ fl, var.equal=T)
## t = 1.0662, df = 218, p-value = 0.2875

##----------------chapter 13-3 상관분석
economics <- as.data.frame(ggplot2::economics)
cor.test(economics$unemploy, economics$pce)
## p-value < 2.2e-16
##       cor 
## 0.6145176

head(mtcars)
car_cor<-cor(mtcars) #상관행렬 생성
round(car_cor, 2) #소수 셋째자리에서 반올림

install.packages("corrplot")
library(corrplot)
corrplot(car_cor)
corrplot(car_cor, method="number")
col<-colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA"))
corrplot(car_cor,
         method = "color", #색깔로 표현
         col=col(200),     # 색상 200개 선정
         type = "lower",   # 왼쪽 아래 행렬만 표시
         order = "hclust", #유사한 상관계수끼리 군집화
         addCoef.col = "black", #상관계수 색깔
         tl.col = "black",      # 변수명 색깔
         tl.srt=45,             # 변수명 45도 기울임
         diag=F)                # 대각행렬제외

##chapter 15 R내장 함수, 변수 타입과 데이터구조
## ---------------chapter 15-1
exam <- read.csv("C:/Users/gangh/Desktop/easy_r/R/csv_exam.csv")
exam[] #조건없이 전체 데이터 출력
exam[1,] #1행 추출
##   id class math english science
## 1  1     1   50      98      50
exam[2,] # 2행 추출
##   id class math english science
## 2  2     1   60      97      60

exam[exam$class ==1,] #class가 1인 행 추출
##   id class math english science
## 1  1     1   50      98      50
## 2  2     1   60      97      60
## 3  3     1   45      86      78
## 4  4     1   30      98      58
exam[exam$math>=80,] #수학 점수가 80점 이상인 행 추출
## id class math english science
## 7   7     2   80      90      45
## 8   8     2   90      78      25
## 18 18     5   80      78      90
## 19 19     5   89      68      87


#1번이면서 수학점수가 50점 이상
exam[exam$class==1&exam$math>=50,]
##   id class math english science
## 1  1     1   50      98      50
## 2  2     1   60      97      60

##영어 점수가 90점 미만이거나 과학점수가 50점 미만
exam[exam$english<90|exam$science<50,]

exam[,1] #첫번째 열 추출출
##  [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20
exam[,2]
##  [1] 1 1 1 1 2 2 2 2 3 3 3 3 4 4 4 4 5 5 5 5
exam[,3]
##  [1] 50 60 45 30 25 50 80 90 20 50 65 45 46 48 75 58 65 80 89 78

exam[,"class"] #class변수 추출
##  [1] 1 1 1 1 2 2 2 2 3 3 3 3 4 4 4 4 5 5 5 5
exam[, "math"] # math 변수 추출
##  [1] 50 60 45 30 25 50 80 90 20 50 65 45 46 48 75 58 65 80 89 78
exam[,c("class", "math", "english")] # class, math, english 동시 추출

exam[1,3]
## [1] 50
exam[5, "english"] ## 행 인덱스, 열 변수명
## [1] 80
exam[exam$math>=50, "english"]
##  [1] 98 97 89 90 78 98 65 56 98 68 78 68 83
exam[exam$math>=50, c("english", "science")] #행 부등호, 열 변수명

##내장 함수 코드
exam$tot <- (exam$math+exam$english+exam$science)/3
aggregate(data=exam[exam$math>=50&exam$english>=80,],tot~class, mean)

##dplyr코드
exam %>%
  filter(math>=50&english>=80) %>%
  mutate(tot=(math+english+science)/3) %>%
  group_by(class) %>%
  summarise(mean=mean(tot))

##chapter 15-2
var1 <- c(1, 2, 3, 1, 2)
var2 <- factor(c(1,2,3,1,2)) #factor변수 생성
var1
##[1] 1 2 3 1 2
var2
## Levels: 3 << 값의 범주가 같이 나온다

var1+2
## [1] 3 4 5 3 4
var2+2
## Ops.ordered(var2, 2)에서: '+' is not meaningful for ordered factors

class(var1)
## [1] "numeric"
class(var2)
## [1] "factor"

levels(var1)
## NULL
levels(var2)
## [1] "1" "2" "3"

var3<-c("a", "b","b","b", "c")
var4 <- factor(c("a", "b", "b", "c"))
var3
## [1] "a" "b" "b" "b" "c"
var4
## [1] a b b c
## Levels: a b c

class(var3)
##[1] "character"
class(var4)
## [1] "factor"

mean(var1)
## [1] 1.8
mean(var2)
##   인자가 수치형 또는 논리형이 아니므로 NA를 반환합니다

var2 <- as.numeric(var2)
mean(var2)
## [1] 1.8

class(var2)
## [1] "numeric"

levels(var2)
## NULL

## chapter 15-3
a<-1 ## 여러 번수 타입을 섞을 수 없음음
b<-"hello"

##데이터 구조 확인
class(a)
## [1] "numeric"
class (b)
## [1] "character"

x1<-data.frame(var1=c(1,2,3),
               var2=c("a","b","c"))
x1
##   var1 var2
## 1    1    a
## 2    2    b
## 3    3    c

#데이터 구조 확인
class(x1)
## [1] "data.frame"

x2<- matrix(c(1:12), ncol=2) #1~12로 2열열
x2
##      [,1] [,2]
## [1,]    1    7
## [2,]    2    8
## [3,]    3    9
## [4,]    4   10
## [5,]    5   11
## [6,]    6   12

#데이터 구조 확인
class(x2)
## [1] "matrix"  

x3<-array(1:20, dim=c(2,5,2)) #1~20으로 2행X5열X2차원
x3
## , , 1

## [,1] [,2] [,3] [,4] [,5]
## [1,]    1    3    5    7    9
## [2,]    2    4    6    8   10

## , , 2

## [,1] [,2] [,3] [,4] [,5]
## [1,]   11   13   15   17   19
## [2,]   12   14   16   18   20

#데이터 구조 확인
class(x3)
## [1] "array"


x4<-list(f1=a,  #벡터
         f2=x1, #데이터 프레임
         f3=x2, #매트릭스
         f4=x3) #어레이
x4
## $f1
## [1] 1

## $f2
## var1 var2
## 1    1    a
## 2    2    b
## 3    3    c
## .....

#데이터 구조 확인
class(x4)
## [1] "list"

mpg<-ggplot2::mpg
x<-boxplot(mpg$cty)
x
## $n
## [1] 234

## $conf
## [,1]
## [1,] 16.48356
## [2,] 17.51644

## $out
## [1] 28 28 33 35 29

## $group
## [1] 1 1 1 1 1

## $names
## [1] "1"

x$stats[,1]
## [1]  9 14 17 19 26
x$stats[,1][3]
## [1] 17
x$stats[,1][2]
## [1] 14