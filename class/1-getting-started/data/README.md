---

Data files:
- `fed_spend_orig.csv`
- `fed_spend_wide.csv`
- `fed_spend_long.csv`

Date downloaded: January 27, 2020

Description: R&D spending by different federal agencies from 1976 to 2017.

Source of downloaded file:
- The fed_spend_orig.csv file was downloaded from this Github repo: https://github.com/rfordatascience/tidytuesday/blob/master/data/2019/2019-02-12/readme.md
- Link to the raw data file: https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-02-12/fed_r_d_spending.csv

Original source:
- The original data source is the American Association for the Advancement of Science Historical Trends website: https://www.aaas.org/programs/r-d-budget-and-policy/historical-trends-federal-rd

Modifications:
- fed_spend_long.csv is the same as fed_spend_orig.csv, except with units of money converted to millions of dollars and with only the R&D spending variable by department and year (the other spending variables are dropped).
- The fed_spend_wide.csv is the same as fed_spend_long.csv but in "wide" format.

Dictionary of fed_spend_orig.csv:

|variable              |class     |description |
|:---|:---|:-----------|
|department            |character | US agency/department          |
|year                  |date/integer   | Fiscal Year           |
|rd_budget             |double    | Research and Development Dollars in inflation-adjusted (constant) dollars           |
|total_outlays         |double    | Total Federal Government spending in inflation-adjusted (constant) dollars         |
|discretionary_outlays |double    | Total Discretionary Federal Government spending in inflation-adjusted (constant) dollars           |
|gdp                   |double    | Total US Gross Domestic Product in inflation-adjusted (constant) dollars         |

Dictionary of fed_spend_long.csv:

|variable              |class     |description |
|:---|:---|:-----------|
|department            |character | US agency/department          |
|year                  |date/integer   | Fiscal Year           |
|rd_budget_mil         |double    | Research and Development Dollars in inflation-adjusted (constant) millions of dollars           |

For reference:
* DOD - Deparment of Defense
* NASA - National Aeronautics and Space Administration
* DOE - Department of Energy
* HHS - Department of Health and Human Services
* NIH - National Institute of Health
* NSF - National Science Foundation
* USDA - US Department of Agriculture
* Interior - Department of Interior
* DOT - Deparment of Transportation
* EPA - Environmental Protection Agency
* DOC - Department of Corrections
* DHS - Department of Homeland Security
* VA - Department of Veterands Affairs
* Other - other research and development spending

---

Data file: `lotr_words.csv`

Date downloaded: January 5, 2020

Description: Words spoken by characters of different races and gender in the Lord of the Rings movie trilogy.

Source of downloaded file:

- Jenny Bryan's Github repo on tidy data: https://github.com/jennybc/lotr-tidy/tree/master/data
- I merged the three separate .csv files for each film into one .csv file.

Original data source:

- Original data file was found here: http://www-958.ibm.com/software/data/cognos/manyeyes/datasets/words-spoken-by-character-race-scene/versions/1.txt
- Note: website above no longer exist.

Dictionary:

variable |class     |description
---------|----------|----------------------
Film     |character |Title of the film
Race     |character |US State
Female   |double    |Number of words spoken by female characters
Male     |double    |Number of words spoken by male characters)

---

Data file: `milk_production.csv`

Date downloaded: January 5, 2020

Description: U.S. Milk production (in pounds) by state from 1970 to 2017

Source of downloaded file:
- The Tidy Tuesday challenge here: https://github.com/rfordatascience/tidytuesday/tree/master/data/2019/2019-01-29
- Here's the link to the original file I downloaded: https://github.com/rfordatascience/tidytuesday/blob/master/data/2019/2019-01-29/state_milk_production.csv

Original data source: The original data source is the USDA (United States Department of Agriculture). See the website here:
https://www.ers.usda.gov/data-products/dairy-data/documentation/#Loc3

Dictionary:

variable      |class     |description
--------------|----------|----------------------
region        |character |Region of the US
state         |character |US State
year          |date      |Year
milk_produced |double    |Pounds of Milk Produced

---

Data file: `nasa_global_temps.txt`

Date downloaded: January 5, 2020

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
year        | year
meanTemp    | Global annual mean temperature anomaly wrt 1951-80 (Celsius)
smoothTemp  | Five-year lowess smooth of the "No_Smoothing" variable

---

Data file: `pv_cell_production.xlsx`

Date downloaded: January 5, 2020

Description: Annual solar photovoltaics cell production by country, 1995-2013
`pv_cells_long.csv` is the same data but in "long" format

Source of downloaded file:
- The Earth Policy Institute
- Downloaded file is "book_tgt_solar_9.xlsx" found here: http://www.earth-policy.org/data_center/C23
- Name of file on site is "Annual Solar Photovoltaics Cell Production by Country, 1995-2013"

Original data source:
- The following is copied from the data file itself: "Compiled by Earth Policy Institute (EPI) with 1995-1999 data from Worldwatch Institute, Signposts 2004, CD-ROM (Washington, DC: 2005); 2000 data from Prometheus Institute, "23rd Annual Data Collection - Final," PVNews, vol. 26, no. 4 (April 2007), pp. 8-9; 2001-2006 from Prometheus Institute and Greentech Media, "25th Annual Data Collection Results: PV Production Explodes in 2008," PVNews, vol. 28, no. 4 (April 2009), pp. 15-18; 2007-2013 compiled by Earth Policy Institute from GTM Research, PV Cell Module Production Data, electronic database, updated June 2014."

Dictionary:

variable              |class  |description
----------------------|-------|----------------------
Year                  |double |Year
China - United States |double |Annual solar photovoltaics cell production for each country
Others                |double |Annual solar photovoltaics cell production for all countries other than those in China - United States
World                 |double |World total annual solar photovoltaics cell production

---

Data file: `tb_cases.csv`

Date downloaded: Jan. 11, 2021

Description:
    This table displays the number of TB cases documented by the World Health
    Organization in Afghanistan, Brazil, and China between 1999 and
    2000. The data contains values associated with four variables
    (country, year, cases, and population). The data is a subset of the data
    contained in the World Health Organization Global Tuberculosis Report.
    The data are loaded with the {tidyverse} package, and I exported them to
    a csv file.

Original Source: https://www.who.int/tb/country/data/download/en/

---

Data file: `north_america_bear_killings.txt`

---

Data file: `uspto_clean_energy_patents.xlsx`

---

Data file: `wildlife_impacts.csv`
