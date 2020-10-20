#Script to analyze and graph sports game data

#Load data into R
rawdata <- read.table("UWvMSU_1-22-13.txt", header= TRUE, stringsAsFactors = FALSE)

#Initialize variables, make table appropriate number of columns
table <- data.frame()
table[1,1]<- 0
table[1,2] <- 0
table[1,3]<- 0
colnames(table)<- c("Time","UW Score","MSU Score")

#FOR loop to search for which team scores and add it to that teams previous score
for (i in 1:nrow(rawdata)){#designates set to length of data set
  table[i,1]<- rawdata[i,1]#Copies over time points from raw data into first column of table
  if (rawdata[i,2]=="UW"){ #If UW scores
    if (i == 1){#only applies if UW scores first
      table[i,2]<-rawdata[i,3] #Loads scoring team's points into matrix
      table[i,3] <-0 #Other team has not scored yet (i==1)
    }else {table[i,2]<- (table[(i-1),2]+rawdata[i,3])#Add new points to existing points of scoring team
    table[i,3] <- table[(i-1),3]#Other teams score does not change and is repeated
    }
  }
  else #If MSU scores
        if (i == 1){#In case MSU scores first
          table[i,3]<-rawdata[i,3] #loads scoring team's points into matrix
          table[i,2]<- 0 #other team has not scored yet (i==1)
        }else {table[i,3]<- (table[(i-1),3]+rawdata[i,3]) #Add new points to existing points of scoring team
        table[i,2]<- table[(i-1),2]#Other teams score does not change and is repeated
        }
}

#PLOTTING

for (k in 1:nrow(table)){
plot(table[k,1],table[k,2],type="1",) #plot UW score vs time

lines(table[k,1],table[k,3],type="1") #Add MSU score vs time
}













  
