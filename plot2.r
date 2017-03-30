#Subset and reorder colunms

library("dplyr")
tbl <- read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?",colClasses=c(rep("character",2),rep("numeric",7)))
tbl <- tbl_df(tbl) %>% filter(Date=="1/2/2007"|Date=="2/2/2007") %>% mutate(Datetime=paste0(Date,Time))
tbl <- tbl[,c(10,3:9)]
tbl$Datetime <- as.POSIXct(tbl$Datetime,tz="GMT",format="%d/%m/%Y%H:%M:%S")

#Activate PNG device
png("plot2.png",width=480,height=480,units="px")
plot(tbl$Datetime,tbl$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()