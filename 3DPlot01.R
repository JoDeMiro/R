library(rgl)

iris

#---------------------
# Creatting 3d plot
#---------------------

with(iris,plot3d(Sepal.Length, Sepal.Width, Petal.Length))

with(iris,plot3d(Sepal.Length, Sepal.Width, Petal.Length, type="s"))

with(iris,plot3d(Sepal.Length, Sepal.Width, Petal.Length, type="s", col = as.integer(Species)))

#---------------------
# Creatting a Surface
#---------------------

persp3d(volcano, col = "red")
rglwidget()

??persp3d

#---------------------
# Creatting a Surface
#---------------------

library(plot3D)
library(plot3Drgl)

volc <- reshape2::melt(volcano)

names(volc)

##-----------
with(volc, scatter3D(x = Var1, y = Var2, z = value))

##-----------
with(volc, scatter3D(x = Var1, y = Var2, z = value, ticktype ="detailed", pch=16, xlab="longitude", ylab="latitude", zlab="depth, km", main=""))

##-----------
with(volc, scatter3D(x = Var1, y = Var2, z = value, ticktype ="detailed", pch=16, xlab="longitude", ylab="latitude", zlab="depth, km", main=""))
plotrgl(lighting=TRUE, smooth=TRUE, cex=2);
title3d(main = "Sample 3D Plot", line=4, cex=2)
next3d(clear = F)
title3d("Deepth", cex=2, line=0.8)
next3d(clear = F)


