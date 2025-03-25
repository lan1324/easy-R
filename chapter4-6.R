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

