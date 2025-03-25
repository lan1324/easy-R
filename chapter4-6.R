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