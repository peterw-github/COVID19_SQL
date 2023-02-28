
-- Table Query. Provides Global Total Cases, Total Deaths, Total Fully Vaccinated, and Population. 

SELECT MAX(d.total_cases) as Global_Cases, 
		MAX(CONVERT(int, d.total_deaths)) as Global_Deaths, 
		MAX(CONVERT(bigint, v.people_fully_vaccinated)) as Global_FullyVaccinated,
		MAX(d.population) as Global_Population
FROM CovidProject..DEATHS D
JOIN CovidProject..Vaccinations V
	  ON D.date = V.date AND D.location = V.location
WHERE d.LOCATION = 'WORLD';









-- Line & Area Chart Query
-- Time series data. Provides Global daily COVID cases, deaths, vaccination doses, and cumulative population fully vaccinated.

WITH TABLE1 AS 
(
	SELECT D.Date, sum(D.new_cases_smoothed) as GlobalCases_7DayAvg, sum(cast(D.new_deaths_smoothed as float)) as GlobalDeaths_7DayAvg,
					sum(cast(V.new_vaccinations_smoothed as float)) as GlobalDoses_7DayAvg
	FROM CovidProject..Deaths D 
	JOIN CovidProject..Vaccinations V
		ON D.location = V.location and D.Date = V.Date
	WHERE d.continent is not null
	GROUP BY D.date
),

TABLE2 AS 
(
	SELECT Date, people_fully_vaccinated_per_hundred as PercentFullyVaxxed
	FROM CovidProject..Vaccinations 
	WHERE location = 'World'
)

SELECT T1.Date, T1.GlobalCases_7DayAvg, T1.GlobalDeaths_7DayAvg, T1.GlobalDoses_7DayAvg, T2.PercentFullyVaxxed
FROM TABLE1 T1
JOIN TABLE2 T2 ON T1.date = T2.date
ORDER BY Date;










-- World Map Query. Provides Total Cases, Total Deaths, % Infected, and % Vaccinated, for each country. 

SELECT d.Location, MAX(d.total_cases) as TotalCases,  MAX((d.total_cases/d.population))*100 as PercentInfected,
		MAX(cast(d.total_deaths as int)) as TotalDeaths, MAX((v.people_fully_vaccinated/v.population))*100 as PercentVaccinated
FROM CovidProject..Deaths D 
JOIN CovidProject..Vaccinations V 
	ON d.date = v.date and d.location = v.location
WHERE NOT (d.continent IS NULL OR total_cases IS NULL)
GROUP BY d.Location, d.Population
ORDER BY PercentVaccinated DESC;










-- Bar Chart Query. Provides Total Cases, Total Deaths, and Population, for each continent.

WITH TABLE1 AS 
(
	SELECT location, SUM(cast(new_cases as int)) as Total_Cases, SUM(cast(new_deaths as int)) as Total_Deaths
	FROM CovidProject..Deaths
	WHERE continent is null 
		and location not like '%income%' and location not in ('International', 'European Union', 'World')
	GROUP BY location
), 

TABLE2 AS
(
	SELECT location, population
	FROM CovidProject..Deaths
	WHERE date = '2023-02-20' 
		and continent is null 
		and location in ('Africa', 'Asia', 'Europe', 'North America', 'Oceania', 'South America')
)

SELECT T1.location, T1.Total_Cases, T1.Total_Deaths, T2.Population
FROM TABLE1 T1
JOIN TABLE2 T2 ON T1.location = T2.location;
