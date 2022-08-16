#install.packages("ggplot2")
library(ggplot2)#패키지 목록체크와 동일한 기능. 

x <- c("a","a","b","c")
x

qplot(x)

#미국환경보호국에서 공개한 자료로 mpg는 캘런
#hwy는 자동차가 고속도로에서 1캘런에 몇 마일 변수(연비)
#data에 mpg, x축에  hwy 변수 지정해서 그래프로 출력 
#mpg의 도시연비 cty와 고속도로 연비hwy를 합하여 통합연비라는 새로운변수를 구할 수 있다. 
qplot(data=mpg, x=hwy)

?qplot

#x축 
qplot(data=mpg, x=cty)

#x축 drv, y축 hwy, 선 그래프 형태 
qplot(data=mpg, x=drv,y=hwy,geom="line")

#x축 drv, y축 hwy, 박스 그래프 형태 
qplot(data=mpg, x=drv,y=hwy,geom="boxplot")

#x축 drv, y축 hwy, 박스 그래프 형태, drv별 색 표현 
qplot(data=mpg, x=drv,y=hwy,geom="boxplot", color=drv)


