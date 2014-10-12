url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "./household_power_consumption.zip", method = "curl")  
unzip("./household_power_consumption.zip")
p_data<-read.table("household_power_consumption.txt", sep = ";", header = TRUE)
DT<-paste(p_data$Date,p_data$Time, sep = "")
DTpos<-strptime(DT, format = "%d/%m/%Y %H:%M:%S")
p_data<-cbind(p_data,DTpos)
index<-DTpos$year==107&DTpos$mon==1&DTpos$mday==1|DTpos$year==107&DTpos$mon==1&DTpos$mday==2
data<-p_data[index,]
plot(y=(as.numeric(data$Global_active_power)/1000), x=data$DTpos, xlab="", ylab= "Global Active Power(kilowats)", type="l")
dev.copy(png, file = "~/plot2.png")
dev.off()
