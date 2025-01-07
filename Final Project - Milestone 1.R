#ALANGYAM GODLIVER
#MILESTONE PROJECT
#ALY 6010 - PROBABILITY AND STATISTICS

library(pacman)
p_load(ggplot2)
p_load(tidyverse)
library(dplyr)
library(tidyr)
library(gmodels)
library(plotly)
library(reshape2)
library(stats)
library(lubridate)
library(scales)
p_load(janitor)

air_quality <- read_csv("Air_Quality.csv")

# Convert dates to proper format
air_quality$Start_Date <- as.Date(air_quality$Start_Date, format="%m/%d/%Y")


# Create separate dataframes for each pollutant
pm25_data <- air_quality %>%
  filter(`Indicator ID` == 365) %>%
  filter(`Geo Type Name` == "UHF42") |> mutate(PM2.5 = "Data Value")

no2_data <- air_quality%>%
  filter(`Indicator ID` == 375) %>%
  filter(`Geo Type Name`  == "UHF42")

so2_data <- air_quality %>%
  filter(`Indicator ID` == 640) %>%
  filter(`Geo Type Name`  == "UHF42")



# Calculate descriptive statistics for PM2.5
pm25_stats <- pm25_data %>%
  summarize(
    mean_value = mean(`Data Value`, na.rm = TRUE),
    median_value = median(`Data Value`, na.rm = TRUE),
    sd_value = sd(`Data Value`, na.rm = TRUE),
    min_value = min(`Data Value`, na.rm = TRUE),
    max_value = max(`Data Value`, na.rm = TRUE),
    n_observations = n()
  )

write.csv(pm25_stats, "pm25_stats")

# Calculate descriptive statistics for NO2
no2_stats <- no2_data %>%
  summarize(
    mean_value = mean(`Data Value`, na.rm = TRUE),
    median_value = median(`Data Value`, na.rm = TRUE),
    sd_value = sd(`Data Value`, na.rm = TRUE),
    min_value = min(`Data Value`, na.rm = TRUE),
    max_value = max(`Data Value`, na.rm = TRUE),
    n_observations = n()
  )
write.csv(no2_stats, "no2_stats")




# Visualization 1: PM2.5 Trends Over Time by Region
timeseries <- ggplot(pm25_data, aes(x = Start_Date, y = `Data Value`, color = `Geo Place Name`)) +
  geom_line() +
  geom_point() +
  theme_minimal() +
  labs(title = "PM2.5 Trends Over Time by NYC Region",
       x = "Date",
       y = "PM2.5 (mcg/m3)",
       color = "Region") +
  theme(legend.position = "bottom",
        legend.text = element_text(size = 8)) +
  scale_x_date(date_breaks = "1 year", date_labels = "%Y") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggsave("timeseries.png", timeseries)


# Visualization 2: Box Plot of PM2.5 by Region
boxplot <- ggplot(pm25_data, aes(x = reorder(`Geo Place Name`, `Data Value`), y = `Data Value`)) +
  geom_boxplot() +
  theme_minimal() +
  labs(title = "Distribution of PM2.5 Levels by NYC Region",
       x = "Region",
       y = "PM2.5 (mcg/m3)") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggsave("boxplot.png", boxplot)




# Visualization 3: NO2 vs PM2.5 Scatter Plot
combined_data <- inner_join(
  pm25_data %>% select(`Geo Place Name`, `Data Value`, Start_Date) %>% 
    rename(pm25 = `Data Value`),
  no2_data %>% select(`Geo Place Name`, `Data Value`, Start_Date) %>% 
    rename(no2 = `Data Value`),
  by = c("Geo Place Name", "Start_Date")
)

scatterplot_combined <- ggplot(combined_data, aes(x = pm25, y = no2, color = `Geo Place Name`)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  theme_minimal() +
  labs(title = "Relationship between NO2 and PM2.5 Levels",
       x = "PM2.5 (mcg/m3)",
       y = "NO2 (ppb)",
       color = "Region") +
  theme(legend.position = "bottom")

ggsave("scatterplot_combined.png", scatterplot_combined)




# Visualization 4: Seasonal Patterns of PM2.5
pm25_data <- pm25_data %>%
  mutate(season = case_when(
    grepl("Summer", `Time Period`) ~ "Summer",
    grepl("Winter", `Time Period`) ~ "Winter",
    TRUE ~ "Annual Average"
  ))

violin <- ggplot(pm25_data %>% filter(season != "Annual Average"), 
       aes(x = season, y = `Data Value`, fill = season)) +
  geom_violin() +
  geom_boxplot(width = 0.1) +
  theme_minimal() +
  labs(title = "Seasonal Distribution of PM2.5 Levels",
       x = "Season",
       y = "PM2.5 (mcg/m3)") +
  theme(legend.position = "none")


ggsave("violin.png", violin)

