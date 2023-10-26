/*
Queries chosen to be used for Tableau Viz
*/

-- 1.
Select sum(new_cases) as total_cases, sum(cast(new_deaths as int)) as total_deaths, (sum(CONVERT(float, new_deaths)) / sum(NULLIF(CONVERT(float, new_cases), 0))) * 100 AS DeathPercentage
From PortfolioProject..CovidDeaths
Where continent is not null
order by 1,2

-- 2.
Select location, SUM(cast(new_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
Where continent is null 
and location not in ('World', 'European Union', 'International', 'High income', 'Upper middle income', 'Lower middle income', 'Low income')
Group by location
order by TotalDeathCount desc

-- 3.
Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From PortfolioProject..CovidDeaths
Group by Location, Population
order by PercentPopulationInfected desc

-- 4.
Select Location, Population,date, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From PortfolioProject..CovidDeaths
Group by Location, Population, date
order by PercentPopulationInfected desc