library(readr)
X201807_data <- read_csv("201807_data.csv")
X201808_data <- read_csv("201808_data.csv")
X201809_data <- read_csv("201809_data.csv")
X201810_data <- read_csv("201810_data.csv")
X201811_data <- read_csv("201811_data.csv")
X201812_data <- read_csv("201812_data.csv")
X201901_data <- read_csv("201901_data.csv")
AllData <- rbind (X201807_data, X201808_data , X201809_data , X201810_data , X201811_data , X201812_data)

Han2018 <- subset(AllData, select = c("Date", "Page_Name", "Message", "All_Reaction_Count", "LIKE_COUNT", "ANGRY_COUNT", "Share_Count"), subset = (Page_Name == ("韓國瑜")))
Han2018
Han2018 $ Date = as.POSIXct( Han2018 $ Date , format  =  " %Y/%m/%d %H:%M:%S " )


Hanall2018 <- subset(AllData, select = c("Date", "Page_Name", "Message", "All_Reaction_Count", "LIKE_COUNT", "ANGRY_COUNT", "Share_Count"), subset = (Page_Name == ("韓國瑜")|(Page_Name == ("韓國瑜粉絲團"))|(Page_Name == ("韓國瑜新聞網"))|(Page_Name == ("高雄選韓國瑜News"))|(Page_Name == ("韓國瑜民間粉絲團（志工團"))|(Page_Name == ("高雄在地韓國瑜News"))|(Page_Name == ("侯友宜 盧秀燕 韓國瑜 北中南連線"))))
Hanall2018 $ Date = as.POSIXct( Hanall2018 $ Date , format  =  " %Y/%m/%d %H:%M:%S " )
Hanall20181 = sub(pattern = "韓國瑜粉絲團", replacement = "韓國瑜粉絲", x = Hanall2018$Page_Name ) 
Hanall20182 = sub(pattern = "侯友宜 盧秀燕 韓國瑜 北中南連線", replacement = "韓國瑜粉絲", x = Hanall20181) 
Hanall20183 = sub(pattern = "高雄在地韓國瑜News", replacement = "韓國瑜粉絲", x = Hanall20182 ) 
Hanall20184 = sub(pattern = "高雄在地韓國瑜News", replacement = "韓國瑜粉絲", x = Hanall20183 ) 
Hanall20185 = sub(pattern = "韓國瑜民間粉絲團（志工團", replacement = "韓國瑜粉絲", x = Hanall20184 ) 
Hanall20186 = sub(pattern = "韓國瑜新聞網", replacement = "韓國瑜粉絲", x = Hanall20185 ) 
Hanall20187 = sub(pattern = "高雄選韓國瑜News", replacement = "韓國瑜粉絲", x = Hanall20186 ) 


Chen2018<- subset(AllData, select = c("Date", "Page_Name", "Message", "All_Reaction_Count", "LIKE_COUNT", "ANGRY_COUNT", "Share_Count"), subset = (Page_Name == ("陳其邁 Chen Chi-Mai")))
Chen2018 $ Date = as.POSIXct( Chen2018 $ Date , format  =  " %Y/%m/%d %H:%M:%S " )

HanLiCO<- data.frame(Hanall2018$LIKE_COUNT , nchar(Hanall2018$Message), Hanall20187)
ChenLiCO<- data.frame(Chen2018$LIKE_COUNT , nchar(Chen2018$Message), Chen2018$Page_Name)
colnames(HanLiCO) <- c("like","Message_Length","name" )
colnames(ChenLiCO) <- c("like","Message_Length","name" )
library(reshape2)
library(plyr)
combinedLiCO <- rbind.fill(HanLiCO, ChenLiCO)


library(ggplot2)
ggplot(HanLiCO) + geom_point(data = HanLiCO, aes(ChenLiCO, mean), colour = 'red', size = 3)
+ labs(title="Kaohsiung")

# High Density Scatterplot with Binning
library(hexbin)
x <- Hanall2018$LIKE_COUNT
y <- nchar(Hanall2018$Message)
bin<-hexbin(x, y, xbins=50) 
plot(bin, main="Hexagonal Binning")
Hanall2018$LIKE_COUNT
Hanall2018$Message
## Default S3 method:
plot(x = Hanall2018$LIKE_COUNT, y = nchar(Hanall2018$Message + type = p  + xlim(0,100) , ylim(0,100)))

qplot(Hanall2018$Date, Hanall2018$LIKE_COUNT, xlim = c(0,2500),ylim= c(0,200))


     