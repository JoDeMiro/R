#Make a periodic dataset
set.seed(1)
data <- c(3,2,1,5,7,8,9,1,3,12,4,5)
data <- rep(data,5)
data <- data+seq(1,length(data)) #Add trend
data <- data+rnorm(length(data))*5 #Add noise
data <- ts(data,frequency=12)
plot(data)


#Build models
library(forecast)
model1 <- StructTS(data)
model2 <- ets(data)
model3 <- auto.arima(data)
model4 <- stl(data,s.window='periodic')


#Test accuracy (on training data)
round(accuracy(model1),4)
round(accuracy(model2),4)
round(accuracy(model3),4)
p4 <- model4$time.series
p4 <- p4[,'seasonal']+p4[,'trend']+p4[,'remainder']
round(accuracy(data,p4),4)  #This model needs to be tested OUT of sample


#Forecast 1 period
f1 <- forecast(model1,h=12) #this fails for some reason
f2 <- forecast(model2,h=12)
f3 <- forecast(model3,h=12)
f4 <- forecast(model4,h=12)

par(mfrow = c(2,2))
plot(f1)
plot(f2)
plot(f3)
plot(f4)
