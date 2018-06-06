NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")
sub2<-SCC[grep("[Cc]oal",SCC$SCC.Level.Three),]
sub21<-sub2 %>% merge(NEI,by="SCC") %>% 
mutate(year=as.factor(year)) %>% 
group_by(year,SCC.Level.Three) %>% 
summarize(total_emissions=sum(Emissions,na.rm=TRUE))
ggplot(sub21,aes(year,total_emissions,group=SCC.Level.Three,col=SCC.Level.Three))+
geom_line(size=1.25)+scale_y_log10()
dev.copy(png,file="plot4.png")
dev.off()
