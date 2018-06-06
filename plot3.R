NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")
library(ggplot2)
sub11 <- sub1 %>% mutate(afyear = as.factor(year)) %>% 
group_by(afyear, type) %>% summarize(total_emissions = sum(Emissions, na.rm = TRUE)) %>%
arrange(desc(total_emissions, by_group = TRUE))
ggplot(sub11,aes(afyear,total_emissions))+geom_bar(stat = "identity",aes(fill=afyear))+facet_grid(.~type)
dev.copy(png,file="plot3.png")
dev.off()
