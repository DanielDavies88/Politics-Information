library(readr)
X201807_data <- read_csv("201807_data.csv")
X201808_data <- read_csv("201808_data.csv")
X201809_data <- read_csv("201809_data.csv")
X201810_data <- read_csv("201810_data.csv")
X201811_data <- read_csv("201811_data.csv")
X201812_data <- read_csv("201812_data.csv")
X201901_data <- read_csv("201901_data.csv")
AllData <- rbind (X201807_data, X201808_data , X201809_data , X201810_data , X201811_data , X201812_data)

Han2018 <- subset(AllData, select = c("Date", "Page_Name", "Message", "All_Reaction_Count", "LIKE_COUNT", "SAD_COUNT","ANGRY_COUNT", "Share_Count"), subset = (Page_Name == ("�����")))
Han2018
Han2018 $ Date = as.POSIXct( Han2018 $ Date , format  =  " %Y/%m/%d %H:%M:%S " )


Hanall2018 <- subset(AllData, select = c("Date", "Page_Name", "Message", "All_Reaction_Count", "LIKE_COUNT","SAD_COUNT", "ANGRY_COUNT", "Share_Count"), subset = (Page_Name == ("�����")|(Page_Name == ("����쯻����"))|(Page_Name == ("�����s�D��"))|(Page_Name == ("�����������News"))|(Page_Name == ("�������������Ρ]�Ӥu��"))|(Page_Name == ("�����b�a�����News"))|(Page_Name == ("�J�ͩy �c�q�P ����� �_���n�s�u"))))
Hanall2018 $ Date = as.POSIXct( Hanall2018 $ Date , format  =  " %Y/%m/%d %H:%M:%S " )
Hanall20181 = sub(pattern = "����쯻����", replacement = "����쯻��", x = Hanall2018$Page_Name ) 
Hanall20182 = sub(pattern = "�J�ͩy �c�q�P ����� �_���n�s�u", replacement = "����쯻��", x = Hanall20181) 
Hanall20183 = sub(pattern = "�����b�a�����News", replacement = "����쯻��", x = Hanall20182 ) 
Hanall20184 = sub(pattern = "�����b�a�����News", replacement = "����쯻��", x = Hanall20183 ) 
Hanall20185 = sub(pattern = "�������������Ρ]�Ӥu��", replacement = "����쯻��", x = Hanall20184 ) 
Hanall20186 = sub(pattern = "�����s�D��", replacement = "����쯻��", x = Hanall20185 ) 
Hanall20187 = sub(pattern = "�����������News", replacement = "����쯻��", x = Hanall20186 ) 


Chen2018<- subset(AllData, select = c("Date", "Page_Name", "Message", "All_Reaction_Count", "LIKE_COUNT", "SAD_COUNT" , "ANGRY_COUNT", "Share_Count"), subset = (Page_Name == ("������ Chen Chi-Mai")))
Chen2018 $ Date = as.POSIXct( Chen2018 $ Date , format  =  " %Y/%m/%d %H:%M:%S " )

HanSAD<- data.frame(Hanall2018$Date , Hanall2018$SAD_COUNT, Hanall20187)
ChenSAD<- data.frame(Chen2018$Date, Chen2018$ANGRY_COUNT, Chen2018$Page_Name)
colnames(HanSAD) <- c("time","sad","name" )
colnames(ChenSAD) <- c("time","sad","name" )

combinedSAD <- rbind.fill(HanSAD, ChenSAD)

ggplot(combinedSAD) + geom_line(aes(x= time, y= sad ,color = name) ) + labs(title="Kaohsiung")