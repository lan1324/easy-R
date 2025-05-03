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