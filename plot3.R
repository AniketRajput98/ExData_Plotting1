url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists("./Data")){
  dir.create("./Data")
  download.file(url,"./Data/data.zip")
  unzip("./Data/data.zip",exdir="./Data")
}
dataset<-read.table("./Data/household_power_consumption.txt",na.strings = "?",sep = ";",header = T,stringsAsFactors = F)

#converting date from character to date format
dataset$Date<-as.Date(dataset$Date,"%d/%m/%Y")

#creating a variable containing date(class date) and time(class char)
dataset$datetime<-paste(dataset$Date,dataset$Time)

#converting datatime to class POSIXct
dataset$datetime<-as.POSIXct(dataset$datetime)

#subsetting required data.
dataset<-dataset[dataset$Date=="2007-2-1"|dataset$Date=="2007-2-2",]

png("plot3.png", height = 480, width=480, bg="transparent")

#Creating plot with no lines.
plot(dataset$datetime,dataset$Sub_metering_1,
     xlab = "",
     ylab = "Energy sub metering",
     type="n")

#adding required lines
lines(dataset$datetime,dataset$Sub_metering_1)
lines(dataset$datetime,dataset$Sub_metering_2, col="red")
lines(dataset$datetime,dataset$Sub_metering_3, col="blue")

legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),
       lty = c(1,1,1))

dev.off()
