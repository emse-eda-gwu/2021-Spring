
Data file: nasa_global_temps.csv

Date downloaded: March 1, 2021

Description: NASA data on the change in global surface temperature relative to 1951-1980 average temperatures.

Source of downloaded file:
- Originally downloaded from NASA here: https://data.giss.nasa.gov/gistemp/graphs/graph_data/Global_Mean_Estimates_based_on_Land_and_Ocean_Data/graph.txt
- I modified two of the column names

Original data source: NASA

Other:
- View the NASA plot of these data here: https://climate.nasa.gov/vital-signs/global-temperature/

Dictionary:

variable    | description
------------|----------------------
year        | year (1880 - 2020)
meanTemp    | Global annual mean temperature anomaly wrt 1951-80 (Celsius)
smoothTemp  | Five-year lowess smooth of the "No_Smoothing" variable

---

Data file: `us_covid.csv`

Date downloaded: March 2, 2021

Source of downloaded file: The full data set are from the Hopkins data hosted on datahub.io:
https://datahub.io/core/covid-19#resource-us_simplified

The `us_covid.csv` file is the same as the full one but aggregated by state
