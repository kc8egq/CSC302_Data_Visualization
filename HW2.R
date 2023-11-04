df1=data.frame(Name=c('James','Paul','Richards','Marico','Samantha','Ravi','Raghu',
                      'Richards','George','Ema','Samantha','Catherine'),
               State=c('Alaska','California','Texas','North Carolina','California','Texas',
                       'Alaska','Texas','North Carolina','Alaska','California','Texas'),
               Sales=c(14,24,31,12,13,7,9,31,18,16,18,14))
aggregate(df1$Sales, by=list(df1$State), FUN=sum)

library(dplyr)

df1 %>% group_by(State) %>% summarise(sum_sales = sum(Sales))

setwd("/Users/kennethsebastian/Library/CloudStorage/GoogleDrive-ksebasti@umich.edu/My Drive/DATA")
worldCupMatchesDF = read.csv('WorldCupMatches.csv', header = TRUE)
head(worldCupMatchesDF)

#(a) Find the size of the dataf rame.How many rows,how many columns?
print(paste("The number of rows is ",
  nrow(worldCupMatchesDF),
  ", Number of columns is ",
  ncol(worldCupMatchesDF)
))

#(b) Uses summary function to report the statistical summary of your data. 
print(summary(worldCupMatchesDF))

#(c) Find how many unique locations olympics were held at.
uniqueloc = unique(na.omit(worldCupMatchesDF$City))
print(paste("The count of unique locations is: ",
            length(uniqueloc)
))

#(d) Find the average attendance.
print(paste("The average attendence for matches is: ",mean(worldCupMatchesDF$Attendance,na.rm=TRUE)))
#(e) For each Home Team,what is the total number of goals scored?(Hint:Please refer to question1)
worldCupMatchesDF %>% group_by(Home.Team.Name) %>% summarise(Home.Team.Goals = sum(Home.Team.Goals)) %>% show()
#(f) What is the average number of attendees for each year? Is there a trend or pattern in the data in that sense?
worldCupMatchesDF %>% group_by(Year) %>% summarise(Avg.Attendance = mean(Attendance, na.rm =TRUE)) %>% show()

print(median(worldCupMatchesDF$Attendance, na.rm = TRUE))

###################################################################################################################
setwd("/Users/kennethsebastian/Library/CloudStorage/GoogleDrive-ksebasti@umich.edu/My Drive/DATA")
metabolitesDF = read.csv('metabolite.csv', header = TRUE)
#(a) Find how many Alzheimers patients there are in the dataset.(Hint:Pleaserefertoquestion1)
summary(metabolitesDF)
alzheimersCount = nrow(metabolitesDF[metabolitesDF$Label == "Alzheimer", ])
print(paste("Count of patients with Alzheimer is: ", alzheimersCount))

#(b) Determine the number of missing values for each column.(Hint:is.na())
print(colSums(is.na(metabolitesDF)))

#(c) Remove the rows which has missing value for the Dopamine column and assign the result to a new data frame. (Hint: is.na( ) )
metabolitesMissingDopamineDF =metabolitesDF[!is.na(metabolitesDF$Dopamine), ]
print(metabolitesMissingDopamineDF)

#(d) In the newdataframe,replace the missing values in the c4-OH-Pro column with the median value of the same column. (Hint: there is median( ) function.)
metabolitesMissingDopamineDF %>% mutate(c4.OH.Pro = ifelse(is.na(c4.OH.Pro), median(c4.OH.Pro, na.rm = T),c4.OH.Pro)) %>% show()

#(e) (Optional)Drop columns which have more than 25% missing values.
#(Hint:when you slice your data frame,you can use -c(.., ..., ...) where ... represent one column name)
metabolitesDF = metabolitesDF[, which((!colMeans(is.na(metabolitesDF))) * 100 >= 25)]
print(metabolitesDF)
