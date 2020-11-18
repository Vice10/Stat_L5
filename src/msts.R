library(forecast)
library(lubridate)
duq_train <- energyData[energyData$Datetime <= '2017-08-31',]
duq_test <- energyData[energyData$Datetime >= '2017-09-01',]
msts_power <- msts(duq_train$DUQ_MW, seasonal.periods = c(24,169,24*365.25), start = decimal_date(as.POSIXct("2012-10-01 00:00:00")))

mstl(msts_power) %>% autoplot()
# simple smoothing
plot(ma(msts_power, order=1000))

library("tseries")
adf.test(msts_power, alternative = "stationary")
# correlogram
acf(msts_power, lag.max = 200)
#partial correlogram
pacf(msts_power, lag.max = 200)
