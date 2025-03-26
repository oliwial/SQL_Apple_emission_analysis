-- Total CO2 emissions per year
SELECT
	[Fiscal_Year],
	sum([Emissions]) AS total_emissions
FROM [AppleEmissions].[dbo].[greenhouse_gas_emissions]
GROUP BY [Fiscal_Year]
ORDER BY [Fiscal_Year] ASC;

-- Emissions in 2022 by category and scope
SELECT
	[Fiscal_Year],
	[Category],
	[Scope],
	sum([Emissions]) AS total_emissions
FROM [AppleEmissions].[dbo].[greenhouse_gas_emissions]
WHERE [Fiscal_Year] = 2022
GROUP BY [Fiscal_Year],[Category], [Scope]
HAVING sum([Emissions]) > 0;

-- Details of scope 3 emissions in 2022 
SELECT
	[Category],
	[Description],
	sum([Emissions]) AS total_emissions
FROM [AppleEmissions].[dbo].[greenhouse_gas_emissions]
WHERE [Fiscal_Year] = 2022 
	  AND [Scope] = 'Scope 3'
GROUP BY [Category], [Description]
ORDER BY total_emissions DESC;

-- Employee commute and business travel per capita
SELECT 
	 gge.[Fiscal_Year],
	 [Description],
	 [Employees],
	 [Emissions]*1.0/[Employees] AS emissions_per_capita
FROM [AppleEmissions].[dbo].[greenhouse_gas_emissions] AS gge 
	 LEFT JOIN [AppleEmissions].[dbo].[normalizing_factors] AS nf ON gge.Fiscal_Year = nf.Fiscal_Year
WHERE [Description] IN ('Employee commute','Business travel');

-- Select YoY emission change (%)
WITH yearly_emissions AS(
	 SELECT
		[Fiscal_Year],
		sum([Emissions]) AS total_emissions
	 FROM [AppleEmissions].[dbo].[greenhouse_gas_emissions]
	 GROUP BY [Fiscal_Year] 
	 )
SELECT 
	[Fiscal_Year],
	[total_emissions],
	LAG([total_emissions]) OVER(ORDER BY [Fiscal_Year]) AS previous_year_emissions,
	([total_emissions] - LAG([total_emissions]) OVER(ORDER BY [Fiscal_Year]) )*1.0 /
	LAG([total_emissions]) OVER(ORDER BY [Fiscal_Year]) * 100 AS yoy_change
FROM yearly_emissions
ORDER BY [Fiscal_Year] DESC;

-- Compare YoY emission change with YoY revenue change
WITH yearly_emissions AS(
	 SELECT
		[Fiscal_Year],
		sum([Emissions]) AS total_emissions
	 FROM [AppleEmissions].[dbo].[greenhouse_gas_emissions]
	 GROUP BY [Fiscal_Year] 
	 )
SELECT 
	nf.Fiscal_Year,
	[total_emissions],
	LAG([total_emissions]) OVER(ORDER BY yearly_emissions.Fiscal_Year) AS previous_year_emissions,
	([total_emissions] - LAG([total_emissions]) OVER(ORDER BY yearly_emissions.Fiscal_Year) )*1.0 /
	LAG([total_emissions]) OVER(ORDER BY yearly_emissions.Fiscal_Year) * 100 AS yoy_emission_change,
	LAG([Revenue]) OVER(ORDER BY nf.Fiscal_Year) AS previous_year_revenue,
	([Revenue] - LAG([Revenue]) OVER(ORDER BY nf.Fiscal_Year) )*1.0 /
	LAG([Revenue]) OVER(ORDER BY nf.Fiscal_Year) * 100 AS yoy_revenue_change
FROM yearly_emissions
	 INNER JOIN [AppleEmissions].[dbo].[normalizing_factors] AS nf ON yearly_emissions.Fiscal_Year = nf.Fiscal_Year
ORDER BY nf.Fiscal_Year DESC;
