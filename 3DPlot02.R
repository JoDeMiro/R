library(ggplot2)

??"ggplot"

titanic <- read.csv("C:\\DataExport\\R\\titanic.csv", sep = ",")
??read.csv


head(titanic)
str(titanic)

titanic$Survived <- as.factor(titanic$Survived)
titanic$Sex <- as.factor(titanic$Sex)
titanic$PClass <- as.factor(titanic$PClass)

prop.table(table(titanic$Survived))

## -----------
ggplot(titanic, aes(x = Sex, fill = Survived)) +
  theme_bw() +
  geom_bar() +
  labs(y = "Passenger Count",
       title = "Titanic Survival Rat3es by Sex")



## -----------
ggplot(titanic, aes(x = PClass, fill = Survived)) +
  theme_bw() +
  geom_bar() +
  labs(y = "Passenger Count",
       title = "Titanic Survival Rat3es by PClass")


## -----------
ggplot(titanic, aes(x = Sex, fill = Survived)) +
  theme_bw() +
  facet_wrap(~ PClass) +
  geom_bar() +
  labs(y = "Passenger Count",
       title = "Titanic Survival Rat3es by Sex")


## -----------
ggplot(titanic, aes(x = Age)) +
  theme_bw() +
  geom_histogram(binwidth = 5) +
  labs(y = "Passenger rate",
       x = "Age (binwidht = 5)",
       title = "Age distribution")


## -----------
ggplot(titanic, aes(x = Age, fill = Survived)) +
  theme_bw() +
  geom_histogram(binwidth = 5) +
  labs(y = "Passenger rate",
       x = "Age (binwidht = 5)",
       title = "Age distribution")


## -----------
ggplot(titanic, aes(x = Age, fill = Survived)) +
  theme_bw() +
  geom_histogram(binwidth = 5, position="fill") +
  labs(y = "Passenger rate",
       x = "Age (binwidht = 5)",
       title = "Age distribution")


## -----------
ggplot(titanic, aes(x = Age, col = Survived)) +
  theme_bw() +
  geom_freqpoly(bins = 20) +
  labs(y = "Passenger rate",
       x = "Age (binwidht = 5)",
       title = "Age distribution")



## -----------
ggplot(titanic, aes(x = Age, fill = Survived)) +
  theme_bw() +
  geom_density(alpha = 0.5) +
  labs(y = "Age",
       x = "Survived",
       title = "Age distribution")


## -----------
ggplot(titanic, aes(x = Age, fill = Survived)) +
  theme_bw() +
  facet_wrap(~Sex) +
  geom_density(alpha = 0.5) +
  labs(y = "Age",
       x = "Survived",
       title = "Age distribution")



## -----------
ggplot(titanic, aes(x = Age, fill = Survived)) +
  theme_bw() +
  facet_wrap(~PClass) +
  geom_density(alpha = 0.5) +
  labs(y = "Age",
       x = "Survived",
       title = "Age distribution")


## -----------
ggplot(titanic, aes(x = Age, fill = Survived)) +
  theme_bw() +
  facet_wrap(Sex ~ PClass) +
  geom_density(alpha = 0.5) +
  labs(y = "Age",
       x = "Survived",
       title = "Age distribution")

