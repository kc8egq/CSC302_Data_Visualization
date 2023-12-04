library(ggplot2)

load('/Users/kennethsebastian/Documents/UofMFlint/CSC-302-IntroToDataVisualization/Week6/house_prices.rda')
#1a
house_prices$year <- format(as.Date(house_prices$date, format="%Y-%d-%m"),"%Y")
house_prices

ggplot(house_prices, aes(x=year, y=house_price_index, color=state)) + 
  geom_line() +
  facet_wrap(~ state, nrow = 1) +
  scale_x_discrete(breaks=c('1980','2000','2020'), labels=c('80', '00', '20'))

#1b
library(tidyr)
house_reshaped <- house_prices %>% 
  gather(measure, value, -date, -state, -house_price_perc,-year)
house_reshaped
#1c
ggplot(house_reshaped, aes(x=year, y=value, color=state)) + 
  geom_line() +
  facet_wrap(~ measure, nrow = 1) +
  scale_x_discrete(breaks=c('1980','2000','2020'), labels=c('80', '00', '20'))
#1d skip per note in slack

#question 2
library(lubridate)
load('/Users/kennethsebastian/Documents/UofMFlint/CSC-302-IntroToDataVisualization/Week6/house_prices.rda')
house_prices$year <- format(as.Date(house_prices$date, format="%Y-%d-%m"),"%Y")
house_prices
house_prices%>%gather(key=measure, value=value, -c(house_price_index, date, state))->house_reshaped

ggplot(house_prices, aes(x=year, y=house_price_index, color=state)) + 
  geom_line() +
  facet_wrap(~ state, nrow = 1) +
  scale_x_continuous(breaks = ymd(c("1980-01-01", "2000-01-01", "2020-01-01")), labels = c("80", "00", "20"))
