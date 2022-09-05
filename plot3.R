library(tidyverse)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subset dataframe for Boltimore
em_boltimore <-  subset(NEI, fips == "24510")
# aggregate dataframe based on year
em_boltimore <- aggregate(list(total_emission = em_boltimore$Emissions), list(year = em_boltimore$year, type = em_boltimore$type), FUN = sum)
# make plot
ggplot(data = em_boltimore) +
    geom_point(mapping = aes(x = year, y = total_emission, color = type, size = 4)) +
    geom_line(mapping = aes(x = year, y = total_emission, color = type)) +
    labs(title = "Emission over year by type in Boltimore", x = "Year", y = "Emission")
ggsave("plot3.png")
## From the figure, we can see Non-road, on-road, and non-point have been decreasing by year.
