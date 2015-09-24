setwd('F:/mooc统计模拟课程/Exploratory Data Analysis/project 2')
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subset
BaltimoreNEI <- NEI[NEI$fips=="24510",]

# sum
aggregatedTotalsbyBaltimore <- aggregate(Emissions ~ year, BaltimoreNEI,sum)

png("plot2.png",width=480,height=480,units="px",bg="transparent")

barplot(
    aggregatedTotalsbyBaltimore$Emissions,
    names.arg=aggregatedTotalsbyBaltimore$year,
    xlab="Year",
    ylab="PM2.5 Emissions (Tons)",
    main="Total PM2.5 Emissions From all Baltimore City Sources"
)

dev.off()