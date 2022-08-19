library(dplyr)
df %>% filter(is.na(score)) 
df <- data.frame(sex=c("M","F",NA,"M","F"),
                 score = c(5,4,3,4,NA))
df
#결측치 확인
is.na(df)

#결측치 빈도 출력 
table(is.na(df))

#변수별로 결측치 확인하기 
table(is.na(df$sex))

#score 결측치 빈도 출력 
table(is.na(df$score))

#결측치 포함된 상태로 분석 
#평균산출
mean(df$score)

#합계 산출 
sum(df$score)

library(dplyr)
#score가 NA인 데이터만 출력 
df %>% filter(is.na(score))

#score 결측치 제거 
df %>% filter(!is.na(score))

#결측치 제외한 데이터로 분석하기 
#score 결측치 제거 
df_nomiss <- df %>% filter(!is.na(score))
#score 평균 산출 
mean(df_nomiss$score)
#score 합계산출 
sum(df_nomiss$score)

#여러 변수 동시에 결측치 없는 데이터 추출하기 
#결측치 제외 
df_nomiss <- df %>% filter(!is.na(score)& !is.na(sex))
df_nomiss

#결측치가 하나라도 있으면 제거하기 
#모든 변수에 결측치 없는 데이터 추출 
df_nomiss2 <- na.omit(df)
df_nomiss2

#함수의 결측치 제외 기능 이용하기 
#결측치 제외하고 평균 산출 
mean(df$score, na.rm = T)
#결측치 제외하고 합계 산출 
sum(df$score,na.r
    m = T)

#summarise()dptj na.rm =T 사용하기 
#결측치 생성 
#데이터 불러오기 
exam <- read.csv("../data//csv_exam.csv")

#3,5행의 math에 NA 할당
exam[c(3,5),"math"] <- NA

#평균 구하기 
exam %>%  summarise(mean_math = mean(math))
#결측치 제외하고 평균 산출 
exam %>% summarise(mean_math=mean(math, na.rm=T))

#다른 함수들에 적용 
exam %>% summarise(mean_math = mean(math, na.rm = T),      # 평균 산출
                   sum_math = sum(math, na.rm = T),        # 합계 산출
                   median_math = median(math, na.rm = T))  # 중앙값 산출

#결측치 대체하기 
#결측치 많을 경우 모두 제외하면 데이터 손실 큼 , 대안 -> 다른 값 채워넣기 

#결측치 대체법 
#대표값(평균,최빈값 등)으로 알괄 대체
#통계분석 기법 적용, 예측값 추정해서 대체 

#평균값으로 결측치 대체하기 
mean(exam$math, na.rm =T)
#평균으로 대체하기 (math가 Na면 55로 대체)
exam$math <- ifelse(is.na(exam$math),55, exam$math)
#결측치 빈도표 생성
table(is.na(exam$math))
mean(exam$math) 

#------