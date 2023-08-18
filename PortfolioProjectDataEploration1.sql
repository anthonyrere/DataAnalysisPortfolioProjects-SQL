SELECT *
FROM CovidDeaths
ORDER BY 3,4


SELECT location, date, total_cases, new_cases, total_deaths, population
FROM CovidDeaths
ORDER BY 1,2


--Looking at total cases vs total deaths 
--Shows the liklihood of dying if you contract covid in your country
SELECT location, date, total_cases, total_deaths, CAST(total_deaths as float) / (total_cases)*100 as DeathPercentage
FROM CovidDeaths 
WHERE location like '%igeri%'
ORDER BY 1,2


--looking at the total cases vs the population
--shows what population got covid
SELECT location, date, total_cases, population, (total_cases/population)*100 as PercentagePpulationInfected
FROM CovidDeaths 
WHERE location like '%states%'
ORDER BY 1,2


--looking at countries with the highest infection rate compared to population 
SELECT location, population, MAX(total_cases) as HighestInfectionCount, MAX(total_cases/population)*100 as PercentagePopulationInfected
FROM CovidDeaths 
GROUP BY location, population
ORDER BY PercentagePopulationInfected DESC


--showing countries with highest death count per population
SELECT location, MAX(CAST (total_deaths as int)) as TotalDeathCount 
FROM CovidDeaths 
WHERE continent is not null
GROUP BY location
ORDER BY TotalDeathCount DESC


--Showing continent with highest death 
SELECT location, MAX(CAST (total_deaths as int)) as TotalDeathCount 
FROM CovidDeaths 
WHERE continent is null
GROUP BY location
ORDER BY TotalDeathCount DESC

--Global numbers
SELECT SUM(new_cases) TotalCases, SUM(CONVERT(float, new_deaths)) TotalDeaths, SUM(CONVERT(float, new_deaths))/SUM(new_cases)*100 as DeathPercentage
FROM CovidDeaths 
WHERE continent is not null
ORDER BY 1,2






--looking at total population vs vaccination
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(float,vac.new_vaccinations)) OVER (partition by dea.location ORDER BY dea.location,dea.date) as RollingPeopleVaccinated
FROM CovidDeaths dea
JOIN CovidVaccinations vac
  ON dea.location = vac.location
  and dea.date = vac.date
WHERE dea.continent is not null
ORDER BY 2,3

--Using CTE
with popvsVac(continent, location, date, population, new_vaccinations, RollingPeopleVaccinated)
as
(
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(float,vac.new_vaccinations)) OVER (partition by dea.location ORDER BY dea.location,dea.date) as RollingPeopleVaccinated
FROM CovidDeaths dea
JOIN CovidVaccinations vac
  ON dea.location = vac.location
  and dea.date = vac.date
WHERE dea.continent is not null
--ORDER BY 2,3
)
select *, (RollingPeopleVaccinated/population)*100
from popvsVac


--Using TempTable
DROP TABLE if exists #PercentagePopulationVaccinated
CREATE TABLE #PercentagePopulationVaccinated
(
contintent nvarchar(255),
Location nvarchar(255),
Date datetime,
population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)

INSERT INTO #PercentagePopulationVaccinated
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(float,vac.new_vaccinations)) OVER (partition by dea.location ORDER BY dea.location,dea.date) as RollingPeopleVaccinated
FROM CovidDeaths dea
JOIN CovidVaccinations vac
  ON dea.location = vac.location
  and dea.date = vac.date
WHERE dea.continent is not null
--ORDER BY 2,3
select *, (RollingPeopleVaccinated/population)*100
from #PercentagePopulationVaccinated


--creating view to store data for later visualization
CREATE VIEW PercentagePopulationVaccinated as 
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(float,vac.new_vaccinations)) OVER (partition by dea.location ORDER BY dea.location,dea.date) as RollingPeopleVaccinated
FROM CovidDeaths dea
JOIN CovidVaccinations vac
  ON dea.location = vac.location
  and dea.date = vac.date
WHERE dea.continent is not null
--ORDER BY 2,3
