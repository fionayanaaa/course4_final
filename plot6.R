library(stringr)
library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subset dataframe for LA
em_LA <-  subset(NEI, fips == "06037")

# veichle source
SCC_vehicle <-  SCC[str_detect(SCC$SCC.Level.Two, "Vehicle"), ]

em_vehicle <- inner_join(SCC_vehicle, em_LA, by = c("SCC" = "SCC"))
# aggregate dataframe based on year
em <- aggregate(list(total_emission = em_vehicle$Emissions), list(year = em_vehicle$year), FUN = sum)
# make plot
ggplot(data = em) +
    geom_point(mapping = aes(x = year, y = total_emission)) +
    geom_line(mapping = aes(x = year, y = total_emission)) +
    labs(title = "Emission over year by motor vehicle sources in LA", x = "Year", y = "Emission")
ggsave("plot6.png")

#From both figures, Boltimore has larger changes over time in motor vehicle emissions.