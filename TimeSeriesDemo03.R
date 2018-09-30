 ## https://cran.r-project.org/web/packages/kza/kza.pdf


library(kza)


a <- AirPassengers


#example
z <- kz(a,3)
z <- kz(a,m=c(3,2),k=3)


par(mfrow=c(2,1))
plot(a,type="l",main="austres")
plot(z, type="l",main="KZ filter")
lines(austres, col="blue")
par(mfrow=c(1,1))




#example
t <- seq(0,20,length=20*365)
set.seed(6); e <- rnorm(n = length(t), sd = 2.0)
y <- sin(3*pi*t) + e
z <- kz(y,30)

par(mfrow=c(2,1))
plot(y,ylim=c(-5,5),type="l",main="y = sin(3*pi*t) + noise")
plot(z,ylim=c(-5,5), type="l",main="KZ filter")
lines(sin(3*pi*t), col="blue")
par(mfrow=c(1,1))
