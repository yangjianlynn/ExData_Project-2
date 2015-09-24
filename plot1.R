setwd('F:/mooc统计模拟课程/Exploratory Data Analysis/project 2')
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# to load data

aggregatedTotalByYear <- aggregate(Emissions ~ year, NEI, sum)
# to get total emissions in each year

png("plot1.png",width=480,height=480,units="px",bg="transparent")
barplot(height=aggregatedTotalByYear$Emissions/10^6,
        names.arg=aggregatedTotalByYear$year,
        xlab="years",
        ylab="total PM2.5 emission (10^6 tons)",
        main="Total PM2.5 emissions at various years")
dev.off()