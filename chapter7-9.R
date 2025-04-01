##-----------------chapter 7 ------------
## 7-1데이터정제
df <- data.frame(sex=c("M", "F", NA, "M", "F"), score=c(5, 4, 3, 4, NA)) #따옴표가 없으면 결측치
is.na(df)
## sex score
## [1,] FALSE FALSE
## [2,] FALSE FALSE
## [3,]  TRUE FALSE
## [4,] FALSE FALSE
## [5,] FALSE  TRUE

table(is.na(df)) #결측치 빈도 출력
## FALSE  TRUE 
## 8     2 

table(is.na(df$sex)) #sex결측치 빈도 출력
## FALSE  TRUE 
## 4     1

table(is.na(df$score)) #score결측치 빈도출력
## FALSE  TRUE 
## 4     1 

mean(df$score) #평균산출
# [1] NA < 정상적으로 산출되지 않는다

sum(df$score)
#[1] NA < 합계도 정상적으로 산출되지 않는다

library(dplyr)
df %>% filter(is.na(score)) #score가 NA인 데이터만 출력
## sex score
## 1   F    NA

df %>% filter(!is.na(score)) #score 결측치(NA) 제거된 데이터만 출력
df_nomiss<-df %>% filter(!is.na(score)) #score 결측치 제거
mean(df_nomiss$score)
## [1] 4
sum(df_nomiss$score)
## [1] 16
df_nomiss<-df%>%filter(!is.na(score)&!is.na(sex)) ##score, sex결측치동시제거

df_nomiss2<-na.omit(df) #변수지정없이 결측치 없는 데이터 추출 <<편하지만 데이터의 지나친 소실 우려

mean(df$score, na.rm=T) #결측치 제외하고 평균산출
## [1] 4
sum(df$score, na.rm=T) #결측치 제외하고 합계산출
## [1] 16
exam<-read.csv("C:/Users/gangh/Desktop/easy_r/R/csv_exam.csv")
exam[c(3, 8, 15), "math"] <- NA ##3, 8, 5행의 math에 NA 할당
exam %>% summarise(mean_math=mean(math))
## mean_math
## 1        NA

#math 결측치 제외하고 값 산출
exam %>% summarise(mean_math=mean(math, na.rm=T), sum_math=sum(math, na.rm=T), median_math=median(math, na.rm=T))
## mean_math sum_math median_math
## 1  55.23529      939          50

mean(exam$math, na.rm=T) #결측치 제외하고 math평균 산출
## [1] 55.23529
exam$math<-ifelse(is.na(exam$math), 55, exam$math) #math가 NA면 55로 대체
table(is.na(exam$math)) # 결측치 빈도표 생성

## 7-2이상치 정제하기
outlier<-data.frame(sex=c(1, 2, 1, 3, 2, 1), score=c(5, 4, 3, 4, 2, 6))

