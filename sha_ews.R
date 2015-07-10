# Apply early warning signal toolbox on Shanghai stock market data
# Crystal 20150710
library(earlywarnings)
library(ggplot2)
require(RCurl)
sha <- getURL("https://docs.google.com/spreadsheets/d/1Ft1B6Vt-ned2oM9X0cv5rvRuS2vq92LbBmMumsiDlxM/pub?output=csv")
SHAdata <- read.csv(textConnection(sha))
SHAdata$Date <- as.Date(SHAdata$Date,"%Y/%m/%d")

#plot
qplot(Date,Close,data=SHAdata,geom="line")

#generic early warning signal 
ews <- generic_ews(SHAdata$Close,detrending="first-diff",logtransform=TRUE)
