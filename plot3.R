library(ggplot2)
qplot(year,Emissions,data=sub1,facets=.~type)