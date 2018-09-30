library(quantmod)
library(TTR)
library(PerformanceAnalytics)


SymbolName="^GSPC"
initDate="2007-01-03"
secondDate="2006-01-01::"

symbol<-getSymbols(SymbolName,from=initDate,verbose=TRUE,return.class='zoo')

stock<-xts(get(symbol))

stock.zoo<-GSPC

print( .getSymbols )

plot(GSPC)


names(stock)[names(stock)==paste(symbol,'.Open',sep="")] <- 'Open'
names(stock)[names(stock)==paste(symbol,'.Close',sep="")] <- 'Close'
names(stock)[names(stock)==paste(symbol,'.Volume',sep="")] <- 'Volume'
names(stock)[names(stock)==paste(symbol,'.Adjusted',sep="")] <- 'Adjusted'
names(stock)[names(stock)==paste(symbol,'.High',sep="")] <- 'High'
names(stock)[names(stock)==paste(symbol,'.Low',sep="")] <- 'Low'

# Introduce RSI Indicator
stock$RSI7  = RSI(Cl(stock), 7)
stock$RSI14 = RSI(Cl(stock), 14)
stock$RSI20 = RSI(Cl(stock), 20)

# Create some lags
stock$RSI14_LAG1 = lag(stock$RSI14,1)

# Check it
tail(stock)

# Check it
names(stock)
names(stock.zoo)
names(GSPC)

class(stock)
class(GSPC)
