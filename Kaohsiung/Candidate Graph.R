library(readr)
data07 <- read_csv("201807_data.csv")
data08 <- read_csv("201808_data.csv")
data09 <- read_csv("201809_data.csv")
data10 <- read_csv("201810_data.csv")
data11 <- read_csv("201811_data.csv")
data12 <- read_csv("201812_data.csv")
a<-grep("韓國瑜", data07$Page_Name)

data07[a,]

HGY <- c(length(grep("韓國瑜", data07$Page_Name)),length(grep("韓國瑜", data08$Page_Name)),length(grep("韓國瑜", data09$Page_Name)),length(grep("韓國瑜", data10$Page_Name)),length(grep("韓國瑜", data11$Page_Name)),length(grep("韓國瑜", data12$Page_Name)))
HGY

CCM <- c(length(grep("陳其邁 Chen Chi-Mai", data07$Page_Name)),length(grep("陳其邁 Chen Chi-Mai", data08$Page_Name)),length(grep("陳其邁 Chen Chi-Mai", data09$Page_Name)),length(grep("陳其邁 Chen Chi-Mai", data10$Page_Name)),length(grep("陳其邁 Chen Chi-Mai", data11$Page_Name)),length(grep("陳其邁 Chen Chi-Mai", data12$Page_Name)))
CCM


library(ggplot2)
Han <- data.frame( 
  month = c(7, 8, 9, 10, 11,12), 
  posts = HGY) 
print(Han) 
ggplot(Han, aes(x = month, y = posts)) + geom_bar(stat = "identity") + labs(title="??��?��??")
Chen <- data.frame( 
  month = c(7, 8, 9, 10, 11,12), 
  posts = CCM) 
print(Chen) 
ggplot(Chen, aes(x = month, y = posts)) + geom_bar(stat = "identity") + labs(title="?��?��??? Chen Chi-Mai")
month = c(7, 8, 9, 10, 11,12)

A = data.frame(time  = month ,Han =HGY, Chen = CCM)
colnames(A) <- c("time","韓國瑜","陳其邁")


Kao <- melt(A[, c("time","韓國瑜","陳其邁")], id="time")
Kao
colnames(Kao) <- c("month", "Candidate", "posts")

ggplot(Kao) + geom_line(aes(x=month, y=posts, color=Candidate)) + labs(title="Kaohsiung")
