#---이상치----#
outlier <-data.frame(sex =c(1,2,1,3,2,1),
                     score=c(5,4,3,4,3,2))

outlier#(정상 범주에서 크게 벗어난 값 이상치 종류: 존재할수 없는 값, 극단적인 값) 
# 해결방법 = 이상치를 결측 처리 
# 이상치 확인 -> 분류 
#이상치 확인하기 
table(outlier$sex)
table(outlier$score)
#이상치의 기준 sex:1 또는 2 \\ score는 5이하

#sex가 3일 경우 NA 
outlier$sex <- ifelse(outlier$sex ==3 , NA,outlier$sex)

outlier
#score가 5보다 크면 NA 
outlier$score <- ifelse(outlier$score > 5, NA, outlier$score)
outlier
