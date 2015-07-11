# Apply early warning signal toolbox on Shanghai stock market data
# Crystal 20150710

# Reference: 
# Dakos, V., Carpenter, S. R., Brock, W. A., Ellison, A. M., Guttal, V., Livina, V., … Ke, S. (2012). 
# Methods for Detecting Early Warnings of Critical Transitions in Time Series Illustrated Using 
# Simulated Ecological Data. PLoS ONE, 7(7). doi:10.1371/journal.pone.0041010

library(earlywarnings)
library(ggplot2)
require(RCurl)

# Get Shanghai stock exchange composite time series through google spreadsheet (w/google finance)
# 2015/1/1-2015/7/9
sha <- getURL("https://docs.google.com/spreadsheets/d/1Ft1B6Vt-ned2oM9X0cv5rvRuS2vq92LbBmMumsiDlxM/pub?output=csv")
SHAdata <- read.csv(textConnection(sha))
SHAdata$Date <- as.Date(SHAdata$Date,"%Y/%m/%d")

#plot
qplot(Date,Close,data=SHAdata,geom="line")

#generic early warning signal 
ews <- generic_ews(SHAdata$Close,detrending="first-diff",logtransform=TRUE)
