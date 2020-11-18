library(fpp2)
fc <- ses(msts_power, h=24)
autoplot(fc) + autolayer(fitted(fc))

#
fit <- stlf(msts_power)
plot(forecast(fit))
#
f_mstl <- mstl(msts_power)
autoplot(f_mstl) +geom_line(color = "#00AFBB") + ggtitle('Duquesne Power - Consumption, 2012-17')+
  xlab('Date') + ylab('Consumption in MW')
accuracy(f_mstl,duq_test$DUQ_MW)
tsdisplay(residuals(f_mstl))

#
armod <- arima(msts_power2, 865)

#
fitarfima <- arfima(msts_power)
tsdisplay(residuals(fitarfima))
accuracy(fitarfima$fitted,duq_test$DUQ_MW)

# parameters - DON'T RUN
auto.arima(msts_power, stepwise=TRUE, approximation=TRUE)

# 
library(prophet)
colnames(duq_train) <- c('ds','y')
fit_prophet <- prophet(duq_train)
future_duq <- data.frame(duq_test$Datetime)
colnames(future_duq) <- 'ds'
f_prophet <- predict(fit_prophet,future_duq)
plot(fit_prophet,f_prophet)
prophet_plot_components(fit_prophet,f_prophet)
accuracy(f_prophet$yhat, duq_test$DUQ_MW)

plot(fit_prophet, f_prophet) + add_changepoints_to_plot(fit_prophet)

# M2
fit_prophet2 <- prophet(duq_train, changepoint.range = 0.9, yearly.seasonality=365, weekly.seasonality=24*7)
future_duq <- data.frame(duq_test$Datetime)
colnames(future_duq) <- 'ds'
f_prophet2 <- predict(fit_prophet2,future_duq)
plot(fit_prophet2,f_prophet2)
prophet_plot_components(fit_prophet2,f_prophet2)
accuracy(f_prophet2$yhat, duq_test$DUQ_MW)

#M3 
fit_prophet3 <- prophet(duq_train, changepoint.range = 0.9, weekly.seasonality=14, yearly.seasonality = 60, daily.seasonality = 4)
future_duq <- data.frame(duq_test$Datetime)
colnames(future_duq) <- 'ds'
f_prophet3 <- predict(fit_prophet3,future_duq)
plot(fit_prophet3,f_prophet3)
prophet_plot_components(fit_prophet3,f_prophet3)
accuracy(f_prophet3$yhat, duq_test$DUQ_MW)

