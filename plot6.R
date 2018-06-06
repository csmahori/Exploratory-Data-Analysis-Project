NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")
sub4<-SCC[grep("[Mm]otor|[Vv]ehicle",SCC$SCC.Level.Three),]
sub41<-sub4 %>% merge(NEI,by="SCC") %>% 
filter(fips=="24510") %>% mutate(year=as.factor(year),city="Baltimore") %>%
group_by(year,city) %>% summarize(total_emissions=sum(Emissions))
sub42<-sub4 %>% merge(NEI,by="SCC") %>%
filter(fips=="06037") %>% mutate(year=as.factor(year),city="Los Angeles") %>%
group_by(year,city) %>% summarize(total_emissions=sum(Emissions))
sub43<-rbind(sub41,sub42)
ggplot(sub43,aes(year,total_emissions,group=city,col=city))+geom_line(size=1.25)+scale_y_log10()
dev.copy(png,file="plot6.png")
dev.off()
