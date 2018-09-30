library(quantmod)
library(PerformanceAnalytics)
library(portfolio)


TickerList  <-  c("AAPL", "IBM", "GOOG")
from <- '2017-01-01'
to   <- '2018-01-01'


ClosingPriceRead <- NULL

for(Ticker in TickerList){
  print("fasz")
  print(Ticker)
  getSymbols(Ticker)
}
