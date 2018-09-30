## https://cran.r-project.org/web/packages/strucchange/strucchange.pdf


library(strucchange)


## Load dataset "nhtemp" with average yearly temperatures in New Haven
data("nhtemp")


## plot the data
plot(nhtemp)


## test the model null hypothesis that the average temperature remains constant
## over the years
## compute OLS-CUSUM fluctuation process
temp.cus <- efp(nhtemp ~ 1, type = "OLS-CUSUM")
summary(temp.cus)

## plot the process without boundaries
plot(temp.cus, alpha = 0.01, boundary = FALSE)


## add the boundaries in another colour
bound <- boundary(temp.cus, alpha = 0.01)
lines(bound, col=4)
lines(-bound, col=4)











## Load dataset "nhtemp" with average yearly temperatures in New Haven
data("nhtemp")
## plot the data
plot(nhtemp)
## test the model null hypothesis that the average temperature remains
## constant over the years for potential break points between 1941
## (corresponds to from = 0.5) and 1962 (corresponds to to = 0.85)
## compute F statistics
fs <- Fstats(nhtemp ~ 1, from = 0.5, to = 0.85)
## plot the p values without boundary
plot(fs, pval = TRUE, alpha = 0.01)
## add the boundary in another colour
lines(boundary(fs, pval = TRUE, alpha = 0.01), col = 2)











df1 <- data.frame(y=rnorm(300))
df1[150:300,"y"] <- df1[150:300,"y"]+1
me1 <- mefp(y~1, data=df1[1:50,,drop=FALSE], type="ME", h=1,
            alpha=0.05)
me2 <- monitor(me1, data=df1)
plot(me2, boundary=FALSE)
lines(boundary(me2), col="green", lty="44")














## Nile data with one breakpoint: the annual flows drop in 1898
## because the first Ashwan dam was built
data("Nile")
plot(Nile)
str(Nile)
head(Nile)
bp.nile <- breakpoints(Nile ~ 1)
summary(bp.nile)
plot(bp.nile)
## compute breakdates corresponding to the
## breakpoints of minimum BIC segmentation
breakdates(bp.nile)
## confidence intervals
ci.nile <- confint(bp.nile)
breakdates(ci.nile)
ci.nile
plot(Nile)
lines(ci.nile)






s <- sin(1:100/180*20)
plot(s)
t <- ts(s)
bp.t <- breakpoints(t ~ 1)
summary(bp.t)
plot(bp.t)
breakdates(bp.t)
ci.t <- confint(bp.t)
breakdates(ci.t)
plot(t)
lines(ci.t)







s <- sin(1:100/180*20)+sin(1:100/180)+(1:100)/30
plot(s)
t <- ts(s)
bp.t <- breakpoints(t ~ 1)
summary(bp.t)
plot(bp.t)
breakdates(bp.t)
ci.t <- confint(bp.t)
breakdates(ci.t)
plot(t)
lines(ci.t)












## Nile data with one breakpoint: the annual flows drop in 1898
## because the first Ashwan dam was built
data("Nile")
plot(Nile)
## compute breakpoints
bp.nile <- breakpoints(Nile ~ 1)
## fit and visualize segmented and unsegmented model
fm0 <- lm(Nile ~ 1)
fm1 <- lm(Nile ~ breakfactor(bp.nile, breaks = 1))
lines(fitted(fm0), col = 3)
lines(fitted(fm1), col = 4)
lines(bp.nile, breaks = 1)









## Nile data with one breakpoint: the annual flows drop in 1898
## because the first Ashwan dam was built
data("Nile")
plot(Nile)
## F statistics indicate one breakpoint
fs.nile <- Fstats(Nile ~ 1)
plot(fs.nile)
breakpoints(fs.nile)
lines(breakpoints(fs.nile))



## or
bp.nile <- breakpoints(Nile ~ 1)
summary(bp.nile)


## the BIC also chooses one breakpoint
plot(bp.nile)
breakpoints(bp.nile)







## fit null hypothesis model and model with 1 breakpoint
fm0 <- lm(Nile ~ 1)
fm1 <- lm(Nile ~ breakfactor(bp.nile, breaks = 1))
plot(Nile)
lines(ts(fitted(fm0), start = 1871), col = 3)
lines(ts(fitted(fm1), start = 1871), col = 4)
lines(bp.nile)

## confidence interval
ci.nile <- confint(bp.nile)
ci.nile
lines(ci.nile)







## UK Seatbelt data: a SARIMA(1,0,0)(1,0,0)_12 model
## (fitted by OLS) is used and reveals (at least) two
## breakpoints - one in 1973 associated with the oil crisis and
## one in 1983 due to the introduction of compulsory
## wearing of seatbelts in the UK.
data("UKDriverDeaths")
seatbelt <- log10(UKDriverDeaths)
seatbelt <- cbind(seatbelt, lag(seatbelt, k = -1), lag(seatbelt, k = -12))
colnames(seatbelt) <- c("y", "ylag1", "ylag12")
seatbelt <- window(seatbelt, start = c(1970, 1), end = c(1984,12))
plot(seatbelt[,"y"], ylab = expression(log[10](casualties)))




## testing
re.seat <- efp(y ~ ylag1 + ylag12, data = seatbelt, type = "RE")
plot(re.seat)
## dating
bp.seat <- breakpoints(y ~ ylag1 + ylag12, data = seatbelt, h = 0.1)

summary(bp.seat)
lines(bp.seat, breaks = 2)











data("DJIA")
## look at log-difference returns
djia <- diff(log(DJIA))
plot(djia)

class(djia)
str(djia)

## convenience functions
## set up a normal regression model which
## explicitely also models the variance
normlm <- function(formula, data = list()) {
  rval <- lm(formula, data = data)
  class(rval) <- c("normlm", "lm")
  return(rval)
}

estfun.normlm <- function(obj) {
  res <- residuals(obj)
  ef <- NextMethod(obj)
  sigma2 <- mean(res^2)
  rval <- cbind(ef, res^2 - sigma2)
  colnames(rval) <- c(colnames(ef), "(Variance)")
  return(rval)
}

## normal model (with constant mean and variance) for log returns
m1 <- gefp(djia ~ 1, fit = normlm, vcov = meatHAC, sandwich = FALSE)
plot(m1, aggregate = FALSE)
## suggests a clear break in the variance (but not the mean)


## dating
bp <- breakpoints(I(djia^2) ~ 1)
plot(bp)
## -> clearly one break
bp
time(djia)[bp$breakpoints]

## visualization
djia <- data("DJIA")
plot(djia)
abline(v = time(djia)[bp$breakpoints], lty = 2)
lines(time(djia)[confint(bp)$confint[c(1,3)]], rep(min(djia), 2), col = 2, type = "b", pch = 3)

## visualization
djia <- DJIA
plot(djia)
abline(v = time(djia)[bp$breakpoints], lty = 2)
lines(time(djia)[confint(bp)$confint[c(1,3)]], rep(min(djia), 2), col = 2, type = "b", pch = 3)









library(quantmod)

aapl <- getSymbols("AAPL",return.class='zoo')
class(aapl)
stock <- xts(get(aapl))
class(stock)
stock.zoo <- AAPL

class(AAPL)
str(AAPL)

uj <- AAPL$AAPL.Close
uj <- diff(log(uj))
plot(uj)

class(uj)
str(uj)

## convenience functions
## set up a normal regression model which
## explicitely also models the variance
normlm <- function(formula, data = list()) {
  rval <- lm(formula, data = data)
  class(rval) <- c("normlm", "lm")
  return(rval)
}

estfun.normlm <- function(obj) {
  res <- residuals(obj)
  ef <- NextMethod(obj)
  sigma2 <- mean(res^2)
  rval <- cbind(ef, res^2 - sigma2)
  colnames(rval) <- c(colnames(ef), "(Variance)")
  return(rval)
}


m1 <- gefp(uj ~ lag1, fit = normlm, vcov = meatHAC, sandwich = FALSE)
plot(m1, aggregate = FALSE)


bp <- breakpoints(I(uj^2) ~ 1)
plot(bp)


## visualization
uj <- AAPL$AAPL.Close
plot(uj)
abline(v = time(uj)[bp$breakpoints], lty = 2)
lines(time(uj)[confint(bp)$confint[c(1,3)]], rep(min(uj), 2), col = 2, type = "b", pch = 3)


methods(uj)
typeof(uj)
class(uj)
attributes(uj)





