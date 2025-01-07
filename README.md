# Milestone-Project
This project analyzes and visualizes the New York Air Qualitiy Dataset I found on Data.gov

Part 1: Dataset Overview:
Dataset contains information on New York City air quality surveillance data with various
indicators such as fine particles (PM 2.5), nitrogen dioxide (NO2), and boiler emissions
(SO2). The data includes measurements taken at different geographical locations and time
periods.
Purpose: The purpose of this dataset is to analyze air quality and its impact on health and the
environment.
Data Source: The data source is https://catalog.data.gov/dataset/air-quality .
Data Type: The dataset includes both numerical and categorical data.
Data Fields:
• Unique ID: Unique identifier for each record (numerical)
• Indicator ID: Identifier for each indicator (numerical)
• Name: Name of the indicator (text)
• Measure: Measurement unit (text)
• Measure Info: Additional information about the measure (text)
• Geo Type Name: Geographical type name (text)
• Geo Join ID: Geographical join identifier (numerical)
• Geo Place Name: Geographical place name (text)
• Time Period: Time period of the measurement (text)
• Start_Date: Start date of the measurement (date)
• Data Value: Value of the measurement (numerical)

Part 2: Descriptive Statistics

A total of 18,025 columns and 12 rows are contained in this dataset of which 7 columns are characters, 4 columns are double and 1 logical column. I went on to take a glimpse of the dataset to get a clear view of the data types that are contained in the dataset.
I proceeded to extract readings for three different pollutants: PM2.5, NO₂, and SO₂. I then
conducted descriptive statistical analyses specifically on the NO₂ and PM2.5 pollutants. The mean PM2.5 concentration across all regions is approximately 8.5 mcg/m³ and the mean NO2 concentration is approximately 20.5 ppb. The values range from approximately 6.0 to 12.4 mcg/m³ for the PM2.5 and range from about 8.6 to 33.7 ppb for NO2 pollutant.

Part 3: Data Visualizations 

1. Line plot with multiple time series for PM 2.5
I was curious to see how the trend in the PM 2.5 pollutant over time so I created a timeseries
plot to with timeline from 2009 to 2022.The different colored lines represent different NYC
regions with the points marking the actual measurement of the readings.
Some of the key insights of the graph are as follows:
• Overall decreasing trend in PM2.5 levels across all regions
• Manhattan regions (Greenwich Village, Gramercy Park) consistently show higher levels
• Outer boroughs like Southeast Queens show lower concentrations
• Clear seasonal fluctuations visible in the zigzag pattern
• Most regions converge toward lower levels in recent years

2. Distribution of PM2.5 Levels by Region (Box Plot)
This visualization is a series of box plots that shows different PM 2.5 concentrations for different NYC regions.The boxes shows the quartiles with median lines while the whiskers

show full range excluding outliers. The boxplots shows the full range and distribution of PM2.5 readings for each region and identifies the regions with the highest variability in air
quality and identifies regions with consistently good or poor air quality.

3. Seasonal Patterns of PM2.5 (Violin Plot)
These hybrid violin-box plot shows seasons(Summer and Winter) PM 2.5 concentration. The
shape of the violins shows the distribution density for the various seasonal readings. It reveals
a clear differences in winter vs summer pollution patterns. Winter shows higher median
PM2.5 levels while Summer distributions tend to be more concentrated. The Winter
measurements show greater variability with both seasons show some extreme values.

4. NO2 vs PM2.5 Scatter Plot
This visualization shows the relationship between two pollutants:X-axis: PM2.5 concentration 
Y -axis: NO2 concentration
Points colored by region
Includes trend lines for each region

Key Insights:
Positive correlation between NO2 and PM2.5 levels
Different regions show different correlation patterns
Manhattan regions cluster in higher ranges for both pollutants
Outer borough measurements tend to cluster in lower ranges
Some regions show stronger correlations than others

Summary:
The analysis reveals significant spatial and temporal patterns in NYC's air quality, with clear
improvements over time but persistent challenges in certain areas. Manhattan and high-traffic
regions continue to show elevated pollution levels, suggesting the need for targeted
interventions in these areas.


