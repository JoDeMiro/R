library(pdfetch)

?pdfetch

IBM <- pdfetch_YAHOO("IMB")

View(IBM)

summary(IBM)

head(IBM)

nrow(IBM)

colnames(IBM)

names(IBM)

colnames(IBM) <- tolower( colnames(IBM))

str(IBM)

