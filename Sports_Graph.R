#Script to analyze and graph sports game data

#Load data into R
rawdata <- read.csv("UWvMSU_1-22-13.txt", header= TRUE, stringsAsFactors = FALSE)

#Initialize variables
table <- data.frame()




for (i in rawdata){
  if rawdata[i,2]=="UW"
  table[i,1] <- rawdata[i,3]
  
