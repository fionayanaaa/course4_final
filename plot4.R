library(stringr)
library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subset dataframe containing coal
SCC_comb <-  SCC[str_detect(SCC$EI.Sector, "Fuel Comb"), ]
SCC_coal <-  SCC[str_detect(SCC_coal$EI.Sector, "Coal"), ]
em_coal <- inner_join(SCC_coal, NEI, by = c("SCC" = "SCC"))
# aggregate dataframe based on year
em <- aggregate(list(total_emission = em_coal$Emissions), list(year = em_coal$year), FUN = sum)
# make plot
ggplot(data = em) +
    geom_point(mapping = aes(x = year, y = total_emission)) +
    geom_line(mapping = aes(x = year, y = total_emission)) +
    labs(title = "Emission over year by coal combustion", x = "Year", y = "Emission")
ggsave("plot4.png")
#From the figure, the emission from coal combustion has been decreasing over the years.