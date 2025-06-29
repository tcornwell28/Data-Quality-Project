-- This script creates staging tables to prepare for data cleaning

# Creates table to edit without having to edit raw data
CREATE TABLE layoffs_staging
LIKE layoffs
;

SELECT *
FROM layoffs_staging;

# Inserts all data form layoffs table into layoffs_staging table
INSERT layoffs_staging
SELECT *
FROM layoffs;

# Creates and checks that partition by works before using in CTE
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, industry, total_laid_off, percentage_laid_off, `date`) AS row_num
FROM layoffs_staging
;

# Creates a CTE that lists all duplicate data, changed to partition over everything to accuractely catch duplicates
WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;

# Used to check that the listed duplicates actually exist
SELECT *
FROM layoffs_staging
WHERE company = 'Casper';


# Creates another staging table to help with deleting duplicates
CREATE TABLE `layoffs_staging_2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  # New column added
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;