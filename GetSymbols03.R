library(quantmod)

?quantmod

from <- "2017-01-03"
to   <- "2018-02-10"

AMAZON <- getSymbols("AMZ", from = from, auto.assign = F)

AMAZON <- getSymbols.google("AMZ", from = from, to = to, auto.assign = F)

AMAZON

head(AMAZON)
tail(AMAZON)

str(AMAZON)

names(AMAZON)

colnames(AMAZON)

head(AMAZON$AMZ.Close)

AMAZONReturn <- ROC(AMAZON, type = "discrete")

head(AMAZONReturn)

AMAZONCloseReturn <- ROC(AMAZON$AMZ.Close)

head(AMAZONCloseReturn)

#--------------------
#
# another way get ret
#
#--------------------

AMAZON['2017']

to.weekly(AMAZON)

to.monthly(AMAZON)

to.hourly(AMAZON)

Hi(AMAZON)

dailyReturn(AMAZON)

weeklyReturn(AMAZON)

monthlyReturn(AMAZON)


chartSeries(AMAZON)


barChart(AMAZON)

candleChart(AMAOZON)

addEMA()

addRSI()



