sub2<-SCC[grep("[Cc]oal",SCC$EI.Sector),]
str(sub2)
sub3<-subset(NEI,NEI$SCC %in% sub2$SCC)
str(sub3)
qplot(year,Emissions,data=sub3)
