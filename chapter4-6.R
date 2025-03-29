## ---------chapter 4 ------------
# 4-2 데이터 프레임 만들기
english <- c(90, 80, 60, 70) #영어점수 변수 생성
english
#[1] 90 80 60 70

math <- c(50, 60, 100, 20)
math
# [1]  50  60 100  20

df_midterm <- data.frame(english, math)
df_midterm
##  english math
## 1      90   50
## 2      80   60
## 3      60  100
## 4      70   20

class <- c(1, 1, 2, 2)
df_midterm<-data.frame(english, math, class)
df_midterm
## english math class
## 1      90   50     1
## 2      80   60     1
## 3      60  100     2
## 4      70   20     2

mean(df_midterm$english)
## [1] 75
mean(df_midterm$math)
## [1] 57.5

## 단축해서 한번에
df_midterm<-data.frame(english=c(90, 80, 60, 70), math=c(50, 60, 100, 20), class=c(1, 1, 2, 2))
df_midterm
## english math class
## 1      90   50     1
## 2      80   60     1
## 3      60  100     2
## 4      70   20     2

#혼자서 해보기
df_sale<-data.frame(제품=c("사과", "딸기", "수박"), 가격=c(1800, 1500, 3000), 판매량=c(24, 38, 13))
df_sale
## 제품 가격 판매량
## 1 사과 1800     24
## 2 딸기 1500     38
## 3 수박 3000     13

## 4-3 외부데이터 이용하기
install.packages("readxl") ##함수설치
library(readxl) ##함수로드

df_exam<-read_excel("C:\\Users\\gangh\\Documents\\GitHub\\easy-R\\excel_exam.xlsx") 
##프로젝트 파일 외의 공간에 있으면 경로를 넣어줘아한다. 
## '\U' used without hex digits in character string << \를 특수 명령어로 착각한 것이니 \를 \\나 /로 바꾸면 해결할 수 있다
df_exam

mean(df_exam$english)
## [1] 84.9
mean(df_exam$science)
## [1] 59.45

df_exam_novar<-read_excel("C:/Users/gangh/Documents/GitHub/easy-R/excel_exam_novar.xlsx", col_names = F) 
## col_names 파라미터로 첫번째 행을 변수로 인식, F는 대문자
df_exam_novar

df_exam_sheet<-read_excel("C:/Users/gangh/Documents/GitHub/easy-R/excel_exam_sheet.xlsx", sheet = 3)
## sheet 파라미터를 이용해 지정

df_csv_exam<-read.csv("C:/Users/gangh/Documents/GitHub/easy-R/csv_exam.csv")
##별도의 패키지 설치를 필요로 X
## 변수행 없을 경우 "header = F" 파라미터 이용 cf) col_name = F

df_midterm<-data.frame(english<-c(90, 80, 60, 70), math=c(50, 60, 100, 20), class=c(1, 1, 2, 2))
write.csv(df_midterm, file="df_midterm.csv") ## R 내장함수 이용

saveRDS(df_midterm, file = "df_midterm.rds") ## RDS로 저장

rm(df_midterm) ## df_midterm 삭제
df_midterm
## 에러: 객체 'df_midterm'를 찾을 수 없습니다

df_midterm<-readRDS("C:/Users/gangh/Desktop/easy_r/R/df_midterm.rds", col_name = F)
## 파일 불러오기
df_midterm


## ---------chapter 5 ------------
# 5-1 데이터 파악하기

exam<-read.csv("C:/Users/gangh/Desktop/easy_r/R/csv_exam.csv")
head(exam) ## 데이터 앞부분 출력 (앞에서부터 여섯번째 행까지)
head(exam, 10)

tail(exam) ## 데이터 뒷부분 출력(뒤에서부터 6번째 행까지)
tail(exam, 10) ## 데이터 뒷부분 출력 (뒤에서부터 10번째 행까지)

View(exam) ## 뷰어창에서 데이터 확인 - 맨 앞이 대문자 V

dim(exam) ## 행, 열 출력
## [1] 20  5

str(exam) ##모든 변수의 속성을 한눈에 파악 가능
## 'data.frame':	20 obs. of  5 variables:
## $ id     : int  1 2 3 4 5 6 7 8 9 10 ...
## $ class  : int  1 1 1 1 2 2 2 2 3 3 ...
## $ math   : int  50 60 45 30 25 50 80 90 20 50 ...
## $ english: int  98 97 86 98 80 89 90 78 98 98 ...
## $ science: int  50 60 78 58 65 98 45 25 15 45 ...

summary(exam)
## id            class        math          english        science     
## Min.   : 1.00   Min.   :1   Min.   :20.00   Min.   :56.0   Min.   :12.00 
## 1st Qu.: 5.75   1st Qu.:2   1st Qu.:45.75   1st Qu.:78.0   1st Qu.:45.00 
##1st Qu - 하위 25%에 위치하는 값
## Median :10.50   Median :3   Median :54.00   Median :86.5   Median :62.50  
## Median - 중앙값
## Mean   :10.50   Mean   :3   Mean   :57.45   Mean   :84.9   Mean   :59.45  
## 3rd Qu.:15.25   3rd Qu.:4   3rd Qu.:75.75   3rd Qu.:98.0   3rd Qu.:78.00
## 3rd Qu - 하위 75%지점에 위치하는 값
## Max.   :20.00   Max.   :5   Max.   :90.00   Max.   :98.0   Max.   :98.00 

install.packages("ggplot2")
mpg<-as.data.frame(ggplot2::mpg) ## mpg데이터를 데이터 프레임 형태로 불러옴
## ggplot2::mpg<< ggplot2 속의 mpg데이터를 지칭하는 코드

head(mpg) ## 앞부분 6행 보기
## manufacturer model displ year cyl      trans drv cty hwy fl   class
## 1         audi    a4   1.8 1999   4   auto(l5)   f  18  29  p compact
## 2         audi    a4   1.8 1999   4 manual(m5)   f  21  29  p compact
## 3         audi    a4   2.0 2008   4 manual(m6)   f  20  31  p compact
## 4         audi    a4   2.0 2008   4   auto(av)   f  21  30  p compact
## 5         audi    a4   2.8 1999   6   auto(l5)   f  16  26  p compact
## 6         audi    a4   2.8 1999   6 manual(m5)   f  18  26  p compact

tail(mpg) ## 데이터 뒷부분 보기
## manufacturer  model displ year cyl      trans drv cty hwy fl   class
## 229   volkswagen passat   1.8 1999   4   auto(l5)   f  18  29  p midsize
## 230   volkswagen passat   2.0 2008   4   auto(s6)   f  19  28  p midsize
## 231   volkswagen passat   2.0 2008   4 manual(m6)   f  21  29  p midsize
## 232   volkswagen passat   2.8 1999   6   auto(l5)   f  16  26  p midsize
## 233   volkswagen passat   2.8 1999   6 manual(m5)   f  18  26  p midsize
## 234   volkswagen passat   3.6 2008   6   auto(s6)   f  17  26  p midsize

dim(mpg) ## 행, 열 보기
## [1] 234  11

str(mpg) ## 데이터 속성 보기
## data.frame':	234 obs. of  11 variables:
##  $ manufacturer: chr  "audi" "audi" "audi" "audi" ...
##  $ model       : chr  "a4" "a4" "a4" "a4" ...
##  $ displ       : num  1.8 1.8 2 2 2.8 2.8 3.1 1.8 1.8 2 ...

summary(mpg)
## manufacturer          model               displ            year           cyl       
## Length:234         Length:234         Min.   :1.600   Min.   :1999   Min.   :4.000  
## Class :character   Class :character   1st Qu.:2.400   1st Qu.:1999   1st Qu.:4.000  
## Mode  :character   Mode  :character   Median :3.300   Median :2004   Median :6.000  
## Mean   :3.472   Mean   :2004   Mean   :5.889  
## 3rd Qu.:4.600   3rd Qu.:2008   3rd Qu.:8.000  
## Max.   :7.000   Max.   :2008   Max.   :8.000 

##5-2 변수명 바꾸기

df_raw<-data.frame(var1=c(1, 2, 1), var2=c(2, 3, 2)) ##데이터 프레임 형성
install.packages ("dplyr") ## dplyr설치
library(dplyr) ##함수 로드

df_new<-df_raw ## 복사본 형성
df_new<-rename(df_new, v2=var2) ## rename() 함수로 var2 > v2
df_new
## var1 v2
## 1    1  2
## 2    2  3
## 3    1  2

#혼자서 해보기
## Q1.  mpg 불러와 복사본 만들기
library(ggplot2)
mpg<-ggplot2::mpg
mpg_new<-mpg

## Q2. 변수명 변경
mpg_new<-rename(mpg_new, city=cty, highway=hwy)

## Q3 변경 확인
mpg_new
## manufacturer model      displ  year   cyl trans      drv    city highway fl    class  
## <chr>        <chr>      <dbl> <int> <int> <chr>      <chr> <int>   <int> <chr> <chr>  
##   1 audi         a4           1.8  1999     4 auto(l5)   f        18      29 p     compact

##5-3 파생변수 만들기

df<-data.frame(var1=c(4, 3, 8), var2=c(2, 6, 1)) ##데이터 프레임 생성
df$var_sum<-df$var1+df$var2 ## var_sum 파생변수
df$var_mean<-(df$var1+df$var2)/2 ## var_mean 파생변수
df
## var1 var2 var_sum var_mean
## 1    4    2       6      3.0
## 2    3    6       9      4.5
## 3    8    1       9      4.5

mpg$total<-(mpg$cty+mpg$hwy)/2
head(mpg)
## manufacturer model displ  year   cyl trans      drv     cty   hwy fl    class   total
## <chr>        <chr> <dbl> <int> <int> <chr>      <chr> <int> <int> <chr> <chr>   <dbl>
##   1 audi         a4      1.8  1999     4 auto(l5)   f        18    29 p     compact  23.5

summary(mpg$total)
## Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## 10.50   15.50   20.50   20.15   23.50   39.50 

hist(mpg$total) ## 히스토그램 생성

## 요약통계량과 히스토그램 총합결과 total이 20을 넘기면 합격, 아니면 불합격으로 기준삼기

mpg$test<-ifelse(mpg$total>=20, "pass", "fail")
head(mpg, 20)
## manufacturer model ...  total test ##test 속성 생성
## <chr>        <chr> ... <dbl> <chr>
##  1 audi         a4 ...    23.5 pass 
##  2 audi         a4  ... 25   pass 

table(mpg$test) ## 합격 빈도표 생성
## fail pass 
## 106  128 

library(ggplot2) ## 패키지 로드
qplot(mpg$test) ## 막대 그래프 생성


mpg$grade<- ifelse(mpg$total>=30, "A", 
                   ifelse(mpg$total>=20, "B", "C"))
head(mpg, 20)
##manufacturer test  grade
## <chr>     <chr> <chr>
##  1 audi   pass  B    
##  2 audi   pass  B 

table(mpg$grade)
## A   B   C 
## 10 118 106

qplot(mpg$grade)

mpg$grade2<-ifelse(mpg$total>=30, "A",
                   ifelse(mpg$total>=25, "B",
                          ifelse(mpg$total>=20, "C", "D")))


## ---------chapter 6 ------------
##6-2 조건에 맞는 데이터만 추출하기

library(dplyr)
exam<-read.csv("C:/Users/gangh/Desktop/easy_r/R/csv_exam.csv")

exam %>% filter(class==1) ## exam에서 class 가 1인 경우만 추출
## id class math english science
## 1  1     1   50      98      50
## 2  2     1   60      97      60
## 3  3     1   45      86      78
## 4  4     1   30      98      58

exam %>% filter(class != 1) ## 1반이 아닌 경우 추출 
## id class math english science
## 1   5     2   25      80      65
## 2   6     2   50      89      98
## 3   7     2   80      90      45

exam %>% filter(math>50) ## 수학 점수가 50점을 초과하는 경우
exam %>% filter(math<50) ## 수학 점수가 50점 미만인 경우
exam %>% filter(english>=80) ## 영어 점수가 80점 이상인 경우
exam %>% filter(english<=80) ## 영어 점수가 80점 이하인 경우

exam %>% filter(class==1 & math>=50) ## 1반이면서 수학점수 50점 이상
exam %>% filter(class==2 & english >=80)
exam %>% filter(math>=90 | english>=90) ## 수학이나 영어 점수가 90점 이상
exam %>% filter(english<90 | science<50)

##1, 3, 5반에 해당하면 추출
exam %>% filter(class==1 | class==3 | class==5)
exam %>% filter(class %in% c(1,3,5))

class1<-exam %>% filter(class==1) ##class 1인 행 추출, 할당
class2<-exam %>% filter(class==2) ##class 2인 행 추출, 할당
mean(class1$math) ##1반 수학 평균
mean(class$math) ##2반 수학 평균

## 혼자서 해보기
# Q1. 평균 비교
library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)
mpg_4 <- mpg %>% filter(displ<=4)
mpg_5 <- mpg %>% filter(displ>=5)
mean(mpg_4$hwy)
## [1] 25.96319
mean(mpg_5$hwy)
## [1] 18.07895

# Q2. 제조 회사에 따른 연비
mpg_audi<-mpg %>% filter(manufacturer=="audi")
mpg_toyota<-mpg %>% filter(manufacturer=="toyota")
mean(mpg_audi$cty)
## [1] 17.61111
mean(mpg_toyota$cty)
## [1] 18.52941

# Q3. 전체 평균 구하기
mpg_aver<-mpg %>% filter(manufacturer %in% c("chevrolet", "fords", "honda"))
mean(mpg_aver$hwy)
## [1] 25.32143


#6-3 필요한 변수만 추출하기
exam %>% select(math) #math 변수만 추출해 출력
exam %>% select(english)
exam %>% select(class, math, english)
exam %>% select(-math)

exam %>% filter(class==1) %>% select(english) # class 1인 행 중 english 추출
exam %>% select(id, math) %>% head #id, math 앞부분 6행까지 추출
exam %>% select(id, math) %>% head(10) 

#6-4 순서대로 정렬하기
exam %>% arrange(math) #math 오름차순으로 정렬
exam %>% arrange(desc(math)) #math 내림차순으로 정렬
exam %>% arrange(class, math) #class 오름차순 후 math 오름차순 정렬

exam %>% mutate(total=math+english+science)%>%head #total 변수추가, 앞 6행출력
exam %>% 
  mutate(total=math+english+science,          #총변수
         mean=(math+english+science)/3)%>%    # 평균변수
  head 
exam %>%
  mutate(test=ifelse(science>=60, "pass", "fail")) %>%  #ifelse()함수 삽입
  head
exam %>%
  mutate(total=math+english+science) %>%
  arrange(total) %>% #dplyr패키지 사용해서 배열<데이터프레임명 필요x
## cf) df$var_sum
  head 

#6-6집단별로 요약하기
exam %>% summarise(mean_math=mean(math))
##  mean_math
## 1     57.45

exam %>%
  group_by(class) %>% ## class별로 구분
  summarise(mean_math=mean(math)) #class별 math평균
##   class mean_math
## <int>     <dbl>
##   1     1      46.2
## 2     2      61.2
## 3     3      45  
## 4     4      56.8
## 5     5      78 

exam %>%
  group_by(class) %>% ## class별로 구분
  summarise(mean_math=mean(math),
            sum_math=sum(math),
            median_math=median(math), ##중간값
            n=n(), ##빈도수
            sd=sd(math)) ##표준편차

mpg %>%
  group_by(manufacturer, drv) %>% ##회사별, 구동방식별 분리
  summarise(mean_cty=mean(cty)) %>% ##cty평균 산출
  head(10)

mpg %>%
  group_by(manufacturer) %>%  #회사별로 구분
  filter(class=="suv") %>%  #suv 추출
  mutate(tot=(cty+hwy)/2) %>%  #통합연비 파생변수 생성
  summarise(mean_tot=mean(tot)) %>% #통합연비 평균 산출
  arrange(desc(mean_tot)) %>% #내림차순정렬
  head(5) #1-5위 출력

#6-7 데이터 합치기
test1<-data.frame(id=c(1, 2, 3, 4, 5),
                  midterm=c(60, 80, 70, 90, 85))
test2<-data.frame(id=c(1, 2, 3, 4, 5),
                  final=c(70, 83, 65, 95, 80))
total<-left_join(test1, test2, by="id") #id를 기준으로 합쳐 total에 할당
total

name<-data.frame(class=c(1, 2, 3, 4, 5),
                 teacher=c("kim", "lee", "park", "choi", "jung"))
exam_new<-left_join(exam, name, by="class") #다른 변수를 기준으로 들어간다
exam_new

group_a<-data.frame(id=c(1, 2, 3, 4, 5),
                    test=c(60, 80, 70, 90, 85))
group_b<-data.frame(id=c(6, 7, 8, 9, 10), 
                    test=c(70, 83, 65, 95, 80))
group_all<-bind_rows(group_a, group_b) #두 데이터의 변수명이 같아야 함. 다를시 변수명 변경 필요
group_all

