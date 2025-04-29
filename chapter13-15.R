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
  select(f1, cty) %>%
  filter(f1 %in% c("r", "p")) ##regular, premium
table(mpg_diff)