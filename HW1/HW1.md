Daniel:

-------------------------------------------

~~~~03/07/108~~~~
-------------------------------------------

 char:
This function delivers the character length of content.

n = nchar(data$Message):
Once applied to the mayoral candidate data base it tells us the amount of characters of each individual Facebook post.



ke <- subset(data, select = c("Page_Name", "Message"), subset = (Page_Name == "柯文哲"))
      
ken = nchar(ke$Message)             

kenmean <- mean(ken , na.rm = TRUE)

han <- subset(data, select = c("Page_Name", "Message"), subset = (Page_Name == "韓國瑜"))
           
hann = nchar(han$Message)             

hanmean <- mean(hann , na.rm = TRUE)

data.frame(kenmean, hanmean) 

kenmean hanmean

     298    58.5

========

The above code tells us that for in January 2018, the average length of posts by 柯文哲 were longer than posts of 韓國瑜.


-------------------------------------

 grep:
This function retrieves the row number of any content including a certain pattern (value).

k = grep("柯文哲", X201801_data$Page_Name):
This can help us find the row number of each quote by a specific candidate or keywords.
This is more helpful that using a LOGICAL functions as it retrieves all results including the pattern, even if found in conjuction with other info.

gprep"柯文哲" retrieves info from both pages 柯文哲 and 柯文哲市長的543, while Page_Name == 柯文哲 only finds info from the page 柯文哲.

========

k = grep("柯文哲", X201801_data$Page_Name)

length(k)

45

========

The above code retrieves the row number of each of 柯文哲's posts, and by calculating the length of the vector we can see in January 2018 he had 45posts.


-------------------------------------

 grepl:
This function transfers the specified data in to a logical pattern.

m = grepl("柯文哲", X201801_data$Page_Name):
This can help us to refine the data into logical patterns,by candidate names, which makes it easier to analyse.

========

m = grepl("國民黨", X201801_data$Message)

as.integer(m)

mean(m)

0.075

========

The above code retrieves the proportion of candidate posts which specifically reference the KMT.


-------------------------------------

regexpr:
The function searches a specified vector for any provided pattern, retrieving the place that the characters appears, and the length of the pattern.
 
n = regexpr("台灣",X201801_data$Message)
The above code will find whether candaidates Messages contain the keyword Taiwan and which characters the keyword is in the message.

========

data <- X201801_data
han <- subset(data, select = c("Page_Name", "Message"), subset = (Page_Name == ("韓國瑜")) | (Page_Name =="韓國瑜粉絲團"))

n = regexpr("台灣",han$Message)

hantai <- n[c(n>0)] 

hantaimean <- mean(hantai, na.rm = TRUE)

ke <- subset(data, select = c("Page_Name", "Message"), subset = (Page_Name == ("柯文哲")) | (Page_Name =="北美柯文哲粉絲團"))

o = regexpr("台灣",ke$Message)
ketai <- o[c(o>0)] 

ketaimean <- mean(ketai, na.rm = TRUE)

data.frame(hantaimean,ketaimean)

hantaimean ketaimean
 109.5     102.25

========

The above code shows us that if the term Taiwan appears in posts on 柯文哲 affiliated pages on average it appears earlier than in posts connected with 韓國瑜.


----------------------------------
~~~~03/08/108~~~~
-------------------------------------------

sub:

This function will substitue the first instance of a pattern in a string for a prefered pattern.

p = sub(pattern = "北美柯文哲粉絲團", replacement = "柯文哲", x = data$Page_Name  )
The above code replaces the name "北美柯文哲粉絲團" with "柯文哲", this then gives both of the 柯文哲 affiliated pages the same name making analysis easier. This is possible because the string of the column Page_Name only contains a single reference (not a whole sentence which could repeat the target pattern)

========

data <- X201801_data

page <- data$Page_Name

summary(page)
   Length     Class      Mode 
    12648 character character 

kepage <- sub(pattern = "北美柯文哲粉絲團", replacement = "柯文哲", x = page)

kepage1 <- sub(pattern = "柯文哲市長的543", replacement = "柯文哲", x = kepage)

keown <- sum(page == "柯文哲")/sum(kepage1 == "柯文哲")

keown

[1] 0.5333333

hanpage <- sub(pattern = "韓國瑜粉絲團", replacement = "韓國瑜", x = page)

hanpage1 <- sub(pattern = "韓國瑜新聞網", replacement = "韓國瑜", x = hanpage)

hanown <- sum(page == "韓國瑜")/sum(hanpage1 == "韓國瑜")

hanown

[1] 0.05555556

data.frame(hanown, keown)

   hanown     keown

0.05555556 0.5333333

========

The above code shows us that of the social media campaign of 柯文哲 in January 2018 over 53% of posts were contributed by his personal space, in contrast with 韓國瑜 of which only 5% of posts were issued by the candidates personal page.


------------------------------------------

gsub:

This function will substitue all instances of a pattern in a string for a prefered pattern.

r <- gsub(pattern = "台灣" , replacement = "中華民國", x = post)
The above code will replace all instances of "台灣" with "中華民國", this makes it easier to count references to the nation/state. (This code would be making that the assumption that the 2 terms are equatable.)

========

post <- X201801_data$Message

a <- gsub(pattern = "蔡英文" , replacement = "蔡總統", x = post)

b <- gsub(pattern = "空心蔡" , replacement = "蔡總統", x = a)

c <- grep("蔡總統", post)

d <- grep("蔡總統", a)

e <- grep("蔡總統", b)

data.frame(length(c),length(d),length(e))

length.c. length.d. length.e.

      142       767       783

========

The above code shows that in January there were 783 mentions of President Tsai, this number now includes references using other ways to address the president "蔡英文" and "空心蔡". 

-------------------------------------------

substr:

This function subtracts specified parts of a string by character count.

posts70 <- substr(X201801_data$Message[1:30], 1, 70)
The above code will show only the first 70 characters of the (first 30) messages. As research shows that the post that receive the most engagement contain 70 characters or less. Through qualitative assessment it could be possible to see which candidates are able to have the biggest impact within the first 70 characters.

(https://buffer.com/resources/7-facebook-stats-you-should-know-for-a-more-engaging-page)

-------------------------------------------

~~~~03/09/108~~~~
-------------------------------------------
 paste:

This function pastes a specified pattern to a designated location within a vector.

January <- paste("107年1月",X201801_data$Message)

The above code inserts the year and date tothe beginning of each candidate post. This could be helpful if posts from multiple databases (separated by year) were tobe merged.


-----------------------------------------------

strsplit:

This function splits a string, at the defined character, into multiple strings.

========

questions <- grep("\\?",X201801_data$Message)

QPosts <- X201801_data$Message[c(questions)]

QandA <- strsplit(QPosts,"(?<=[?.!|])", perl=TRUE)

QandA

========


The above codes splits messages where there is a question mark. Ideally, this could separate questions and answers given by the candidate themselves. By separating the questions it could be possible to utilise the questions to ask a sample group, seeing how many people would give the same answer, without being directly told by the candidate.
