setwd('F:/moocͳ��ģ��γ�/Exploratory Data Analysis/project 2')
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subset
BaltimoreNEI <- NEI[NEI$fips=="24510",]

# sum
aggregatedTotalsbyBaltimore <- aggregate(Emissions ~ year, BaltimoreNEI,sum)

png("plot3.png",width=480,height=480,units="px",bg="transparent")

library(ggplot2)

ggp <- ggplot(BaltimoreNEI,aes(factor(year),Emissions,fill=type)) +
    geom_bar(stat="identity") +
    theme_bw() + guides(fill=FALSE)+
    facet_grid(.~type,scales = "free",space="free") + 
    labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
    labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

print(ggp)

dev.off()