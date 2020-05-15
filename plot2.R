url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists("./Data")){
  dir.create("./Data")
  download.file(url,"./Data/data.zip")
  unzip("./Data/data.zip",exdir="./Data")
}
#reading text file.
dataset<-read.table("./Data/household_power_consumption.txt",na.strings = "?",sep = ";",header = T,stringsAsFactors = F)

#converting date from character to date format
dataset$Date<-as.Date(dataset$Date,"%d/%m/%Y")

#creating a variable containing date(class date) and time(class char)
dataset$datetime<-paste(dataset$Date,dataset$Time)

#converting datatime to class POSIXct
dataset$datetime<-as.POSIXct(dataset$datetime)

#subsetting required data.
dataset<-dataset[dataset$Date=="2007-2-1"|dataset$Date=="2007-2-2",]


png("plot2.png", height = 480, width=480, bg="transparent")

#creating plot

plot(dataset$datetime,
     dataset$Global_active_power,
     type="l",
     ylab = "Global Active Power(Kilowatts)",
     xlab = "")

dev.off()
