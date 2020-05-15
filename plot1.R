url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists("./Data")){
  dir.create("./Data")
  download.file(url,"./Data/data.zip")
  unzip("./Data/data.zip",exdir="./Data")
}
dataset<-read.table("./Data/household_power_consumption.txt",na.strings = "?",sep = ";",header = T,stringsAsFactors = F)

#To convert date from character to Date format
dataset$Date<-as.Date(dataset$Date,"%d/%m/%Y")

#subsetting dataframe for required data
subset.data<-dataset[dataset$Date=="2007-2-1"|dataset$Date=="2007-2-2",]

#creating graphic device
png("plot1.png",height = 480,width=480,bg="transparent")

hist(subset.data$Global_active_power,col="red",
     main = "Global Active Power",
     xlab = "Global Active Power(kilowatts)",
     ylab = "Frequency")

dev.off()