ggsubseriesplot(msts_power, year.labels=TRUE, year.labels.left=TRUE) +
  ylab("MW") +
  ggtitle("Seasonal plot")

checkresiduals(f_prophet3$yhat_upper)

msts_power2 <- msts(duq_train$DUQ_MW, seasonal.periods = c(24, 169, 24*30.25, 24*365.25), start = decimal_date(as.POSIXct("2012-10-01 00:00:00")))
mstl(msts_power2) %>% autoplot()

hist(energyData$DUQ_MW, col="lightblue")
qqnorm(energyData$DUQ_MW, pch=20); qqline(energyData$DUQ_MW, col="blue") 
pearson.test(energyData$DUQ_MW)
