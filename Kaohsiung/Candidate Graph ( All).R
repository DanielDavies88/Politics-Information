library(readr)
X201807_data <- read_csv("201807_data.csv")
X201808_data <- read_csv("201808_data.csv")
X201809_data <- read_csv("201809_data.csv")
X201810_data <- read_csv("201810_data.csv")
X201811_data <- read_csv("201811_data.csv")
X201812_data <- read_csv("201812_data.csv")
X201901_data <- read_csv("201901_data.csv")
july <- subset(X201807_data, select = c("Page_Name", "Message"), subset = (Page_Name == ("�����")))
Aug <- subset(X201808_data, select = c("Page_Name", "Message"), subset = (Page_Name == ("�����")))
Sep <- subset(X201809_data, select = c("Page_Name", "Message"), subset = (Page_Name == ("�����")))
Oct <- subset(X201810_data, select = c("Page_Name", "Message"), subset = (Page_Name == ("�����")))
Nov <- subset(X201811_data, select = c("Page_Name", "Message"), subset = (Page_Name == ("�����")))
Dec <- subset(X201812_data, select = c("Page_Name", "Message"), subset = (Page_Name == ("�����")))

Han2018 <- c(length(july$Page_Name), length(Aug$Page_Name), length(Sep$Page_Name), length(Oct$Page_Name), length(Nov$Page_Name), length(Dec$Page_Name))
Han2018
date <- c("July", "Aug", "Sep", "Oct", "Nov", "Dec", "Jan")

julyall <- subset(X201807_data, select = c("Page_Name", "Message"), subset = (Page_Name == ("�����")|(Page_Name == ("����쯻����"))|(Page_Name == ("�����s�D��"))|(Page_Name == ("�����������News"))|(Page_Name == ("�������������Ρ]�Ӥu��"))|(Page_Name == ("�����b�a�����News"))|(Page_Name == ("�J�ͩy �c�q�P ����� �_���n�s�u"))))
Augall <- subset(X201808_data, select = c("Page_Name", "Message"), subset = (Page_Name == ("�����")|(Page_Name == ("����쯻����"))|(Page_Name == ("�����s�D��"))|(Page_Name == ("�����������News"))|(Page_Name == ("�������������Ρ]�Ӥu��"))|(Page_Name == ("�����b�a�����News"))|(Page_Name == ("�J�ͩy �c�q�P ����� �_���n�s�u"))))
Sepall <- subset(X201809_data, select = c("Page_Name", "Message"), subset = (Page_Name == ("�����")|(Page_Name == ("����쯻����"))|(Page_Name == ("�����s�D��"))|(Page_Name == ("�����������News"))|(Page_Name == ("�������������Ρ]�Ӥu��"))|(Page_Name == ("�����b�a�����News"))|(Page_Name == ("�J�ͩy �c�q�P ����� �_���n�s�u"))))
Octall <- subset(X201810_data, select = c("Page_Name", "Message"), subset = (Page_Name == ("�����")|(Page_Name == ("����쯻����"))|(Page_Name == ("�����s�D��"))|(Page_Name == ("�����������News"))|(Page_Name == ("�������������Ρ]�Ӥu��"))|(Page_Name == ("�����b�a�����News"))|(Page_Name == ("�J�ͩy �c�q�P ����� �_���n�s�u"))))
Novall <- subset(X201811_data, select = c("Page_Name", "Message"), subset = (Page_Name == ("�����")|(Page_Name == ("����쯻����"))|(Page_Name == ("�����s�D��"))|(Page_Name == ("�����������News"))|(Page_Name == ("�������������Ρ]�Ӥu��"))|(Page_Name == ("�����b�a�����News"))|(Page_Name == ("�J�ͩy �c�q�P ����� �_���n�s�u"))))
Decall <- subset(X201812_data, select = c("Page_Name", "Message"), subset = (Page_Name == ("�����")|(Page_Name == ("����쯻����"))|(Page_Name == ("�����s�D��"))|(Page_Name == ("�����������News"))|(Page_Name == ("�������������Ρ]�Ӥu��"))|(Page_Name == ("�����b�a�����News"))|(Page_Name == ("�J�ͩy �c�q�P ����� �_���n�s�u"))))
HanAll <- c(length(julyall$Page_Name), length(Augall$Page_Name), length(Sepall$Page_Name), length(Octall$Page_Name), length(Novall$Page_Name), length(Decall$Page_Name))

pages<-unique(AllData$Page_Name)
a<- grep("������", pages)
a
b<- pages[a]
b


cjuly <- subset(X201807_data, select = c("Page_Name", "Date", "Message"), subset = (Page_Name == ("������ Chen Chi-Mai")))
cjuly
cAug <- subset(X201808_data, select = c("Page_Name", "Date", "Message"), subset = (Page_Name == ("������ Chen Chi-Mai")))
cSep <- subset(X201809_data, select = c("Page_Name", "Date", "Message"), subset = (Page_Name == ("������ Chen Chi-Mai")))
cOct <- subset(X201810_data, select = c("Page_Name", "Date", "Message"), subset = (Page_Name == ("������ Chen Chi-Mai")))
cNov <- subset(X201811_data, select = c("Page_Name", "Date", "Message"), subset = (Page_Name == ("������ Chen Chi-Mai")))
cDec <- subset(X201812_data, select = c("Page_Name", "Date", "Message"), subset = (Page_Name == ("������ Chen Chi-Mai")))
cJan <- subset(X201901_data, select = c("Page_Name", "Date", "Message"), subset = (Page_Name == ("������ Chen Chi-Mai")))
Chen2018 <- c(length(cjuly$Page_Name), length(cAug$Page_Name), length(cSep$Page_Name), length(cOct$Page_Name), length(cNov$Page_Name), length(cDec$Page_Name))
Chen2018
month <- c(7, 8, 9, 10, 11, 12)
levels(month) <- c(7, 8, 9, 10, 11, 12)


library(ggplot2)
Han <- data.frame(levels(month) ,  posts = Han2018) 
print(Han) 
ggplot(Han, aes(x = month, y = posts)) + geom_bar(stat = "identity") + labs(title="�����")

Chen <- data.frame( 
  month = c(7, 8, 9, 10, 11, 12) , 
  posts = Chen2018) 
print(Chen) 
ggplot(Chen, aes(x = month, y = posts)) + geom_bar(stat = "identity") + labs(title="������ Chen Chi-Mai")


A = data.frame(time  = month ,Han =Han2018, HanAll = HanAll, Chen = Chen2018)
A
colnames(A) <- c("time","�����(�ӤH)", "�����(�M����)","������")


Kao <- melt(A[, c("time","�����(�ӤH)", "�����(�M����)","������")], id="time")
Kao
View(Kao)
colnames(Kao) <- c("month", "Candidate", "posts")

ggplot(Kao) + geom_line(aes(x=month, y=posts, color=Candidate)) + labs(title="Kaohsiung")
