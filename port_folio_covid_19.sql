-- select data that we will be working with
SELECT location, date, total_cases, total_deaths, gdp_per_capita 
FROM `bold-meridian-352610.portfolio.covid_data` 
order by 1,2

-- looking at total_case vs total_deaths

SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)* 100 AS death_percentage
FROM `bold-meridian-352610.portfolio.covid_data`
WHERE location = 'Kenya' 
order by 1,2

-- looking at total_cases vs population
-- shows percentage of people who got covid

SELECT location, date, population, total_cases, (total_cases/population)* 100 AS case_percentage
FROM `bold-meridian-352610.portfolio.covid_data`
WHERE location = 'Kenya' 
order by 1,2

-- countries with the highest infection rate compared to popuation

SELECT location, population, MAX(new_cases) AS highest_infection_count, MAX((new_cases/population))* 100 AS case_percentage
FROM `bold-meridian-352610.portfolio.covid_data` 
GROUP BY location, population
order by case_percentage DESC

-- countries with the highest death count per population

SELECT location, MAX(total_deaths)
FROM `bold-meridian-352610.portfolio.covid_data` 
WHERE continent IS NOT NULL
GROUP BY location
order by MAX(total_deaths) DESC

-- continent death numbers

SELECT continent, MAX(total_deaths) AS deaths_numbers
FROM `bold-meridian-352610.portfolio.covid_data`
WHERE continent is not null
GROUP BY continent
order by MAX(total_deaths) DESC

-- continets withe the highest vacinations

SELECT continent, MAX(total_vaccinations) AS vaccination_numbers
FROM `bold-meridian-352610.portfolio.covid_data`
WHERE continent is not null
GROUP BY continent
order by MAX(total_vaccinations) DESC

-- contient numbers for cases deaths and vaccinations

SELECT continent, MAX(total_cases) as Total_cases, MAX(total_deaths) as Total_deaths, MAX(total_vaccinations) AS vaccination_numbers
FROM `bold-meridian-352610.portfolio.covid_data`
WHERE continent is not null
GROUP BY continent
order by MAX(total_vaccinations) DESC

--global numbers

SELECT MAX(total_cases) as Total_cases, MAX(total_deaths) as Total_deaths, MAX(total_vaccinations) AS vaccination_numbers
FROM `bold-meridian-352610.portfolio.covid_data`
order by MAX(total_vaccinations) DESC