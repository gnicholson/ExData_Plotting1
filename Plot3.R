
#download dataset
DATASET_URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(DATASET_URL, "EDA Project 1.zip")
unzip("EDA Project 1.zip")

power_consumption<-read.table("household_power_consumption.txt",sep = ";",header=F,na.strings="?",skip=grep("1/2/2007", readLines("household_power_consumption.txt")),nrows=2879)
names(power_consumption) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

power_consumption$DateTime <-strptime(paste(power_consumption$Date,power_consumption$Time),"%d/%m/%Y %H:%M:%S")

#plot 3

png("plot3.png", width = 480,height=480)
plot(power_consumption$DateTime,power_consumption$Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering")
lines(power_consumption$DateTime,power_consumption$Sub_metering_2,col="red")
lines(power_consumption$DateTime,power_consumption$Sub_metering_3,col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1), lwd=c(2.5,2.5),col=c("black","red","blue"))
dev.off()
