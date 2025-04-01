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

