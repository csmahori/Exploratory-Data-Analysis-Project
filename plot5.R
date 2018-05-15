table(SCC$EI.Sector)
sub4<-SCC[grep("[Vv]ehicles",SCC$EI.Sector),]
str(sub4)
sub5<-subset(NEI,NEI$SCC %in% sub4$SCC & fips == "24510")
qplot(year,Emissions,data=sub5)
