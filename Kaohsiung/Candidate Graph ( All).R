library(readr)
X201807_data <- read_csv("201807_data.csv")
X201808_data <- read_csv("201808_data.csv")
X201809_data <- read_csv("201809_data.csv")
X201810_data <- read_csv("201810_data.csv")
X201811_data <- read_csv("201811_data.csv")
X201812_data <- read_csv("201812_data.csv")
X201901_data <- read_csv("201901_data.csv")
july <- subset(X201807_data, select = c("Page_Name", "Message"), subset = (Page_Name == ("韓國瑜")))
Aug <- subset(X201808_data, select = c("Page_Name", "Message"), subset = (Page_Name == ("韓國瑜")))
Sep <- subset(X201809_data, select = c("Page_Name", "Message"), subset = (Page_Name == ("韓國瑜")))
Oct <- subset(X201810_data, select = c("Page_Name", "Message"), subset = (Page_Name == ("韓國瑜")))
Nov <- subset(X201811_data, select = c("Page_Name", "Message"), subset = (Page_Name == ("韓國瑜")))
Dec <- subset(X201812_data, select = c("Page_Name", "Message"), subset = (Page_Name == ("韓國瑜")))

Han2018 <- c(length(july$Page_Name), length(Aug$Page_Name), length(Sep$Page_Name), length(Oct$Page_Name), length(Nov$Page_Name), length(Dec$Page_Name))
Han2018
date <- c("July", "Aug", "Sep", "Oct", "Nov", "Dec", "Jan")

julyall <- subset(X201807_data, select = c("Page_Name", "Message"), subset = (Page_Name == ("韓國瑜")|(Page_Name == ("韓國瑜粉絲團"))|(Page_Name == ("韓國瑜新聞網"))|(Page_Name == ("高雄選韓國瑜News"))|(Page_Name == ("韓國瑜民間粉絲團（志工團"))|(Page_Name == ("高雄在地韓國瑜News"))|(Page_Name == ("侯友宜 盧秀燕 韓國瑜 北中南連線"))))
Augall <- subset(X201808_data, select = c("Page_Name", "Message"), subset = (Page_Name == ("韓國瑜")|(Page_Name == ("韓國瑜粉絲團"))|(Page_Name == ("韓國瑜新聞網"))|(Page_Name == ("高雄選韓國瑜News"))|(Page_Name == ("韓國瑜民間粉絲團（志工團"))|(Page_Name == ("高雄在地韓國瑜News"))|(Page_Name == ("侯友宜 盧秀燕 韓國瑜 北中南連線"))))
Sepall <- subset(X201809_data, select = c("Page_Name", "Message"), subset = (Page_Name == ("韓國瑜")|(Page_Name == ("韓國瑜粉絲團"))|(Page_Name == ("韓國瑜新聞網"))|(Page_Name == ("高雄選韓國瑜News"))|(Page_Name == ("韓國瑜民間粉絲團（志工團"))|(Page_Name == ("高雄在地韓國瑜News"))|(Page_Name == ("侯友宜 盧秀燕 韓國瑜 北中南連線"))))
Octall <- subset(X201810_data, select = c("Page_Name", "Message"), subset = (Page_Name == ("韓國瑜")|(Page_Name == ("韓國瑜粉絲團"))|(Page_Name == ("韓國瑜新聞網"))|(Page_Name == ("高雄選韓國瑜News"))|(Page_Name == ("韓國瑜民間粉絲團（志工團"))|(Page_Name == ("高雄在地韓國瑜News"))|(Page_Name == ("侯友宜 盧秀燕 韓國瑜 北中南連線"))))
Novall <- subset(X201811_data, select = c("Page_Name", "Message"), subset = (Page_Name == ("韓國瑜")|(Page_Name == ("韓國瑜粉絲團"))|(Page_Name == ("韓國瑜新聞網"))|(Page_Name == ("高雄選韓國瑜News"))|(Page_Name == ("韓國瑜民間粉絲團（志工團"))|(Page_Name == ("高雄在地韓國瑜News"))|(Page_Name == ("侯友宜 盧秀燕 韓國瑜 北中南連線"))))
Decall <- subset(X201812_data, select = c("Page_Name", "Message"), subset = (Page_Name == ("韓國瑜")|(Page_Name == ("韓國瑜粉絲團"))|(Page_Name == ("韓國瑜新聞網"))|(Page_Name == ("高雄選韓國瑜News"))|(Page_Name == ("韓國瑜民間粉絲團（志工團"))|(Page_Name == ("高雄在地韓國瑜News"))|(Page_Name == ("侯友宜 盧秀燕 韓國瑜 北中南連線"))))
HanAll <- c(length(julyall$Page_Name), length(Augall$Page_Name), length(Sepall$Page_Name), length(Octall$Page_Name), length(Novall$Page_Name), length(Decall$Page_Name))

pages<-unique(AllData$Page_Name)
a<- grep("陳其邁", pages)
a
b<- pages[a]
b


cjuly <- subset(X201807_data, select = c("Page_Name", "Date", "Message"), subset = (Page_Name == ("陳其邁 Chen Chi-Mai")))
cjuly
cAug <- subset(X201808_data, select = c("Page_Name", "Date", "Message"), subset = (Page_Name == ("陳其邁 Chen Chi-Mai")))
cSep <- subset(X201809_data, select = c("Page_Name", "Date", "Message"), subset = (Page_Name == ("陳其邁 Chen Chi-Mai")))
cOct <- subset(X201810_data, select = c("Page_Name", "Date", "Message"), subset = (Page_Name == ("陳其邁 Chen Chi-Mai")))
cNov <- subset(X201811_data, select = c("Page_Name", "Date", "Message"), subset = (Page_Name == ("陳其邁 Chen Chi-Mai")))
cDec <- subset(X201812_data, select = c("Page_Name", "Date", "Message"), subset = (Page_Name == ("陳其邁 Chen Chi-Mai")))
cJan <- subset(X201901_data, select = c("Page_Name", "Date", "Message"), subset = (Page_Name == ("陳其邁 Chen Chi-Mai")))
Chen2018 <- c(length(cjuly$Page_Name), length(cAug$Page_Name), length(cSep$Page_Name), length(cOct$Page_Name), length(cNov$Page_Name), length(cDec$Page_Name))
Chen2018
month <- c(7, 8, 9, 10, 11, 12)
levels(month) <- c(7, 8, 9, 10, 11, 12)


library(ggplot2)
Han <- data.frame(levels(month) ,  posts = Han2018) 
print(Han) 
ggplot(Han, aes(x = month, y = posts)) + geom_bar(stat = "identity") + labs(title="韓國瑜")

Chen <- data.frame( 
  month = c(7, 8, 9, 10, 11, 12) , 
  posts = Chen2018) 
print(Chen) 
ggplot(Chen, aes(x = month, y = posts)) + geom_bar(stat = "identity") + labs(title="陳其邁 Chen Chi-Mai")


A = data.frame(time  = month ,Han =Han2018, HanAll = HanAll, Chen = Chen2018)
A
colnames(A) <- c("time","韓國瑜(個人)", "韓國瑜(和粉絲)","陳其邁")


Kao <- melt(A[, c("time","韓國瑜(個人)", "韓國瑜(和粉絲)","陳其邁")], id="time")
Kao
View(Kao)
colnames(Kao) <- c("month", "Candidate", "posts")

ggplot(Kao) + geom_line(aes(x=month, y=posts, color=Candidate)) + labs(title="Kaohsiung")

