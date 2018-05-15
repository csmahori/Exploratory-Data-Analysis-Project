sub1<-subset(NEI,NEI$fips=="24510")
y<-tapply(sub1$Emissions,sub1$year,sum)
x<-c(1999,2002,2005,2008)
plot(x,y,ylab='Total PM2.5 Emission(Baltimore City, Maryland)',xlab='Year')
