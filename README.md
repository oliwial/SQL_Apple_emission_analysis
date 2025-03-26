# SQL_Apple_emission_analysis
# 1. Project Overview
This project analyzes the Apple greenhouse gas (GHG) emissions in years 2015-2022, focusing on year-over-year (YoY) trends, scope-based categorization, and emissions per capita. The goal is to assess emission drivers, identify key reduction opportunities, and compare emission trends with financial growth metrics. The dataset includes three key tables:

    Greenhouse Gas Emissions: Contains yearly emissions categorized by scope and type.
    Normalizing Factors: Includes company revenue, market capitalization, and employee count.
    Carbon Footprint by Product: Details product-specific carbon footprints.

The data comes from [Maven Analytics Apple's Greenhouse Gas Emissions Challenge](https://mavenanalytics.io/challenges/maven-environmental-challenge/ec3b9855-923d-4647-ac7a-c6ded422b2b7)
I used MS-SQL server and imported the data in .csv format to a database in my local machine.

# 2. Key Performance Indicators (KPIs)

1️⃣ Total CO₂ Emissions Per Year

    Tracks the company’s total emissions over multiple fiscal years.

    Provides insights into long-term emission trends and sustainability performance.
2️⃣ Emissions in 2022 by Category and Scope

    Breaks down emissions by category (e.g., energy, transportation, manufacturing) and scope (1, 2, and 3).

    Helps pinpoint major sources of emissions in the latest reporting year.

3️⃣ Details of Scope 3 Emissions in 2022

    Analyzes emissions from indirect sources, including supply chain, purchased goods, and transportation.

    Identifies areas where vendor partnerships or operational changes could reduce the company’s carbon footprint.

4️⃣ Employee Commute and Business Travel Per Capita

    Evaluates emissions from employee travel relative to workforce size.

    Useful for assessing the impact of hybrid work policies or travel reduction strategies.

5️⃣ Year-over-Year (YoY) Emission Change (%)

    Calculates the percentage increase or decrease in emissions compared to the previous year.

    Tracks the effectiveness of emission reduction initiatives.

6️⃣ Comparison of YoY Emission Change with YoY Revenue Change

    Analyzes the relationship between emissions and company revenue.

    Helps determine if the company is achieving sustainable growth, reducing emissions while increasing revenue.
    
# 3. Business Insights & Impact

- KPI2 Showed that in year 2022 most of the emissions came from the Scope 3. Further analyis into emission description showed that majority of the emissions originates from manufacturining, product use, and product transportation. These are the key areas to focus in the future optimisation of emissions.
- KPI2 also showed that employee commuting and business travels cause a lot of emissions. Emission in these categories was calculated per capita to check the trend of individual impact (KPI4). It shows that emissions per capita have decreased over the years, what can be a result of sustainablity policy optimization.
- KPI5 shows that emissions decrease on a yearly basis, however, not at a steady pace. Having that information enables to evaluate the impact of actions taken to reduce emissions in previous years and make strategic decisions in the future.
- KPI6 provides a perspective on whether financial growth aligns with environmental responsibility.


# 4. Next Steps

- Develop Power BI dashboards for interactive data exploration.

- Implement scenario modeling to evaluate the impact of potential sustainability initiatives.

- Align findings with corporate ESG (Environmental, Social, Governance) goals for reporting and compliance.
