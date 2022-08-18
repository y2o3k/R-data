install.packages(c("dplyr", "hflights"))
library(dplyr)
library(hflights)
install.packages("ggplot2")
exam <- read.csv("../data//csv_exam.csv")


exam
dim(exam)
#exam 에서 class가 1인 경우만 추출해 출력 
exam %>%  filter(class==1)
#math가 50점을 초과한 경우 
exam %>%filter(math>50)
#영어 점수가 80점 이하 출력 
exam %>%filter(english<80)

#여러조건 & and |or를 사용새서 나열 
#1반이면서 수학 점숙 50점 이상인 경우 
exam %>% filter(class == 1 & math >=50)

#영어 점수가 90점 미만 이거나 과학점수가 50점 미만인 경우 
exam %>% filter(english>90 | science <50)
 
#math만 추출 
exam %>% select(math)

#class , math ,english만 출력
exam %>% select(class,math,english)

#science만 제외
exam %>% select(-science)

#class가 1인 행만 추출한 다음 english 추출 

class1 <-exam %>% filter(class==1)

exam %>%
     filter(class==1) %>%
     select(class, english)

#id, math 추출하되, 앞부분 6행 까지만 
exam %>% head(6) %>% 
         select(id, math)

#math 오름차순 
exam %>% 
     arrange(math)

#math 내림차순 
exam %>% arrange(desc(math))

#반 별로 수학점수를 오름차순으로 정렬
 exam %>% arrange(class,math)
 
 #총 합 변수 추가 
 exam %>% 
      mutate(total = math +english +science,
             mean=(math +english +science)/3)       %>% head
#과학 점수가 60점 이상이면 pass, 그렇지 않으면 fail 
 exam %>% 
   mutate(test=ifelse(science >=60,"pass","fail"))

# 종합 점수를 계산하고 총합 점수 순으로 정렬 
 exam %>% mutate(total = math+english +science) %>% arrange(total)

 #집단별 요약 
 #math 평균 산출 
 exam %>% summarise(mean_math =mean(math))
 #class별로 분리//math 평균 산출 
 exam %>% 
   group_by(class) %>% 
   summarise(mean_math = mean(math))

 #class별로 분리 
 #math평균
 #math합계
 #math중앙값 
 #학생 수 
 
 exam %>%
   group_by(class) %>% 
   summarise(mean_math = mean(math) , 
    sum_math=sum(math),  
    median_math=median(math),
    n=n())

 # <----dplyr 패키지 응용----->
 # mpg에 대해 
 #1.회사별로 추출 
 #2.suv추출
 #3.통합 연비 변수 생성 
 #4.통합 연비 평균 산출
 #5.내림차순 정렬
 #6.1~5위 까지 출력 
 
 library(ggplot2)
 mpg <- as.data.frame(ggplot2::mpg)
 mpg %>% 
   group_by(manufacturer) %>%
  filter(class=="suv") %>%  
     mutate(tot=(cty+hwy)/2) %>% 
summarise(mean_tot=mean(tot))%>% 
   arrange(desc(mean_tot)) %>% 
             head(5)
 
         
   #데이터 합치기 (가로/세로)
 #중간고사
 test1 <- data.frame(id=c(1,2,3,4,5),midterm=c(60,70,80,90,85))
 #기말고사 
 test2 <- data.frame(id=c(1,2,3,4,5),final=c(70,80,90,20,45))
 
 test1
 test2
 #합치기 
 #id를 기준으로 합침
 total<-left_join(test1,test2, by="id") 
 total
# 반별 담임 교사 
 name <- data.frame(class =c(1,2),teacher =c("kim","lee"))
name 

exam_new <- left_join(exam,name,by="class")

exam_new

#세로 합치기 
#학생 1~5번 시험 데이터 생성 
group_a <-data.frame(id=c(1,2,3,4,5),
                     test=c(60,70,80,90,85))
#학생 6~10번 시험 데이터 생성 
group_b <-data.frame(id=c(6,7,8,9,10),
                     test=c(30,70,30,90,85))
group_all <-bind_rows(group_a,group_b)
group_all
