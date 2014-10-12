url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "./household_power_consumption.zip", method = "curl")  
unzip("./household_power_consumption.zip")
p_data<-read.table("household_power_consumption.txt", sep = ";", header = TRUE)
DT<-paste(p_data$Date,p_data$Time, sep = "")
DTpos<-strptime(DT, format = "%d/%m/%Y %H:%M:%S")
p_data<-cbind(p_data,DTpos)
index<-DTpos$year==107&DTpos$mon==1&DTpos$mday==1|DTpos$year==107&DTpos$mon==1&DTpos$mday==2
data<-p_data[index,]
plot(y=data$Sub_metering_1, x=data$DTpos, xlab="", ylab= "Energy sub metering", type="n")
lines(x=data$DTpos,y=data$Sub_metering_1, col = "black")
lines(x=data$DTpos,y=data$Sub_metering_2, col = "red")
lines(x=data$DTpos,y=data$Sub_metering_3, col = "blue")
series=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
colors=c("black","red","blue")
legend("topright", lwd=2, legend=series, col=colors)
dev.copy(png, file = "~/plot3.png")
dev.off()

