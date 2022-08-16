english <- c(91,92,93,94)
english

math <- c(50,60,70,80)
math

#데이터 프레임에 할당 
df_midterm <- data.frame(english,math)
df_midterm


class <- c(1,1,2,2)
class
#학생의 반을 추가 
df_midterm <- data.frame(english, math, class)
df_midterm

#데이터 분석 
mean(df_midterm$english) #영어평균
