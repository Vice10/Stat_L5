energyData <- read.csv("./data/DUQ_hourly.csv")
energyData$Datetime <- as.POSIXct(energyData$Datetime, '%Y-%m-%d %H:%M:%S', tz="EDT")
energyData <- energyData[energyData$Datetime >= '2012-10-01 00:00:00' & energyData$Datetime <= '2017-09-30 00:00:00',]
head(energyData,10)

library(ggplot2)
ggplot(data = energyData, aes(x = Datetime, y = DUQ_MW))+
  geom_line(color = "#00AFBB", size = 0.5) + ggtitle('Duquesne Power - Consumption, 2012-2017')+
  xlab('Date') + ylab('Consumption in MW')

# pick seasonality
ggplot(data = energyData[energyData$Datetime >= '2016-01-01' & energyData$Datetime <= '2016-12-31',], aes(x = Datetime, y = DUQ_MW))+
  geom_line(color = "#00AFBB", size = 0.5) + ggtitle('Duquesne Power - Consumption, 2016')+
  xlab('Date') + ylab('Consumption in MW')

ggplot(data = energyData[energyData$Datetime >= '2016-07-01 00:00:00' & energyData$Datetime <= '2016-07-01 23:00:00',], aes(x = Datetime, y = DUQ_MW))+
  geom_line(color = "#00AFBB", size = 0.5) + ggtitle('Duquesne Power - Consumption, 2016')+
  xlab('Date') + ylab('Consumption in MW')
