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
