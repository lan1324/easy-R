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
table(outlier$sex)
table(outlier$score)

#sex가 3이면서 NA할당
outlier$sex<-ifelse(outlier$sex==3, NA, outlier$sex)
outlier

#score가 5보다 크면 NA할당
outlier$score<-ifelse(outlier$score>5, NA, outlier$score)
outlier

outlier %>%
  filter(!is.na(sex) & !is.na(score)) %>% ##이상값을 제하고 평균 내기
  group_by(sex) %>%
  summarise(mean_score=mean(score))

#극단치 제거하기
#상자그림으로 극단치 기준 정하기

boxplot(mpg$hwy)
boxplot(mpg$hwy)$stats
## [,1]
## [1,]   12
## [2,]   18
## [3,]   24
## [4,]   27
## [5,]   37

## 12-37사이를 벗어나면 NA할당
mpg$hwy<-ifelse(mpg$hwy<12|mpg$hwy>37, NA, mpg$hwy)
table(is.na(mpg$hwy))
## FALSE  TRUE 
## 231     3 

mpg %>%
  group_by(drv) %>%
  summarise(mean_hwy=mean(hwy, na.rm=T))
##   drv   mean_hwy
## <chr>    <dbl>
##  1 4         19.2
## 2 f         27.7
## 3 r         21  

## ----------------------chapter 8----------
## 8-2 산점도-변수간 관계 표현하기
library(ggplot2)

#x축은 displ, y축은 hwy로 지정해 배경생성
ggplot(data=mpg, aes(x=displ, y=hwy))

## 배경에 산점도 추가
ggplot(data=mpg, aes(x=displ, y=hwy)) + geom_point()

## x축 범위 3-6, y축 범위 10-30으로 지정
ggplot(data=mpg, aes(x=displ, y=hwy)) + geom_point() +
  xlim(3, 6) +
  ylim(10, 30)

## 데이터 프레임 생성
library(dplyr)
df_mpg<-mpg %>%
  group_by(drv) %>%
  summarise(mean_hwy=mean(hwy))
df_mpg

## 그래프 생성
ggplot(data=df_mpg, aes(x=drv, y=mean_hwy)) + geom_col()
ggplot(data=df_mpg, aes(x=reorder(drv, -mean_hwy), y=mean_hwy)) + geom_col()

##빈도그래프
ggplot(data=mpg, aes(x=drv)) + geom_bar()
ggplot(data=mpg, aes(x=hwy)) + geom_bar()

ggplot(data=economics, aes(x=date, y=unemploy)) + geom_line()

ggplot(data=mpg, aes(x=drv, y=hwy)) + geom_boxplot()


## -------------------chapter 9------------
#9-1 한국복지패널데이터 분석
install.packages("foreign")
library(foreign) #spss파일 불러오기
library(dplyr) #전처리 함수 패키지
library(ggplot2) #시각화 함수 패키지
library(readxl) # 엑셀파일 불러오기 함수

raw_welfare<-read.spss(file="C:/Users/gangh/Desktop/easy_r/R/Koweps_hpc10_2015_beta1.sav", to.data.frame=T) 
welfare<-raw_welfare ## 복사본 만들기

head(welfare)
tail(welfare)
View(welfare)
dim(welfare)
str(welfare)
summary(welfare)

welfare<-rename(welfare,
                sex=h10_g3, 
                birth=h10_g4, 
                marriage=h10_g10,
                religion=h10_g11,
                income=p1002_8aq1,
                code_job=h10_eco9,
                code_region=h10_reg7)

##9-2 성별에 따른 월급차이

##성별데이터처리
class(welfare$sex)
table(welfare$sex)
## 1    2 
## 7578 9086  이상치 없음을 확인
welfare$sex<-ifelse(welfare$sex==1, "male", "female")
qplot(welfare$sex)

class(welfare$income)
summary(welfare$income) ##table함수를 쓰기엔 항목이 너무 많다
qplot(welfare$income)+xlim(0, 1000) ##월급은 1-9998사이/0, 9999는 결측치처리

welfare$income<-ifelse(welfare$income %in% c(0, 9999), NA, welfare$income)
table(is.na(welfare$income))

sex_income<-welfare %>%
  filter(!is.na(income)) %>%
  group_by(sex) %>%
  summarise(mean_income=mean(income))
sex_income
## sex    mean_income
## <chr>        <dbl>
## 1 female        163.
## 2 male          312.  남성이 월급평균이 더 높다

ggplot(data=sex_income, aes(x=sex, y=mean_income))+geom_col()

##9-3 나이와 월급의 관계
class(welfare$birth)
summary(welfare$birth) ##내에 이상치는 없음/결측치없음
qplot(welfare$birth)

#파생변수 나이 만들기
welfare$age<-2015-welfare$birth+1
summary(welfare$age)
qplot(welfare$age)

age_income<-welfare %>%
  filter(!is.na(income)) %>%
  group_by(age) %>%
  summarise(mean_income=mean(income))
ggplot(data=age_income, aes(x=age, y=mean_income))+geom_line()

#9-4연령대에 따른 월급 차이
# 연령대 파생변수 만들기
welfare <- welfare %>%
  mutate(ageg=ifelse(age<30, "young", 
                     ifelse(age<=59, "middle", "old")))
qplot(welfare$ageg)

ageg_income<-welfare %>%
  filter(!is.na(income)) %>%
  group_by(ageg) %>%
  summarise(mean_income=mean(income))

ggplot(data=ageg_income, aes(x=ageg,y=mean_income)) + geom_col() + scale_x_discrete(limits=c("young", "middle", "old"))
## 밑의 영문자 알파벳 순으로 진행되지 않도록

## 9-5 연령대와 성별
