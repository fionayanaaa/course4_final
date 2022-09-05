NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subset dataframe for Boltimore
em_boltimore <-  subset(NEI, fips == "24510")
# aggregate dataframe based on year
em_boltimore <- aggregate(list(total_emission = em_boltimore$Emissions), list(year = em_boltimore$year), FUN = sum)
# make plot
png("plot2.png", width = 480, height = 480)
plot(em_boltimore$year, em_boltimore$total_emission, type = "b", col = "blue", xlab = "Year", ylab = "Total Emissions", main = "Emission over years in Boltimore")
dev.off()
