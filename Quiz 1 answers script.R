## These are the work used to answers Quiz number 1 questions using data set 
## questions 11 - 20

## Q:12         display the first two rows
head(data, 2)

## Q:13         Find the number of rows
nrow(data)

## Q:14         Display the last to rows
tail(data, 2)

## Q:15         what is the value of Ozone in the 47th row
data[47,]

## Q: 16        find how many NAs in Ozone column
summary(data)  #or
sum(is.na(data$Ozone))

## Q:17         mean of Ozone
summary(data) #or
mean(data$Ozone[!is.na(data$Ozone)])

## Q:18         Extract the subset of rows where Ozone values are above 31
##              and Temp values are above 90. What is the mean of Solar.R
good <- complete.cases(data$Ozone, data$Solar.R, data$Temp)

mean(data$Solar.R[good & data$Ozone > 31 & data$Temp > 90])

## Q:19         Mean of "Temp" when "Month" is equal to 6?
good <- complete.cases(data$Month, data$Temp)

mean(data$Temp[good & data$Month == 6])

## Q:20         Maximum ozone value in month of May (Month == 5)?
max(data$Ozone[data$Month==5 & !is.na(data$Ozone)])





