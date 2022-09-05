NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# aggregate dataframe based on year
em <- aggregate(list(total_emission = NEI$Emissions), list(year = NEI$year), FUN = sum)
# make plot
png("plot1.png", width = 480, height = 480)
plot(em$year, em$total_emission, type = "b", col = "blue", xlab = "Year", ylab = "Total Emissions", main = "Emission over years")
dev.off()
