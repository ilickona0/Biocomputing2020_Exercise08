#Script to analyze and graph sports game data

#Load data into R
rawdata <- read.table("UWvMSU_1-22-13.txt", header= TRUE, stringsAsFactors = FALSE)

#Initialize variables, make table appropriate number of colums
table <- data.frame()
table[1,1]<- 0
table[1,2] <- 0
table[1,3]<- 0
colnames(table)<- c("Time","UW Score","MSU Score")

for (i in 1:nrow(rawdata)){
  table[i,1]<- rawdata[i,1]
  if (rawdata[i,2]=="UW"){
    if (i == 1){
      table[i,2]<-rawdata[i,3]
      table[i,3] <-0
    }else {table[i,2]<- (table[(i-1),2]+rawdata[i,3])
    table[i,3] <- table[(i-1),3]
    }
  }
  else 
        if (i == 1){
          table[i,3]<-rawdata[i,3]
          table[i,2]<- 0
        }else {table[i,3]<- (table[(i-1),3]+rawdata[i,3])
        table[i,2]<- table[(i-1),2]
        }
}

  
