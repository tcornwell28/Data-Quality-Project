-- This script handles standardizing the data

SELECT company, (TRIM(company))
FROM layoffs_staging_2;
# Removes leading and ending whitespace from company names
UPDATE layoffs_staging_2
SET company = TRIM(company);

# Looks at each distinct industry in the dataset
SELECT DISTINCT industry
FROM layoffs_staging_2
ORDER BY 1;

SELECT DISTINCT industry
FROM layoffs_staging_2;

SELECT *
FROM layoffs_staging_2
WHERE industry LIKE 'Crypto%';

# Upadates Crypto industry names to all be just Crypto
UPDATE layoffs_staging_2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

SELECT DISTINCT country, TRIM(TRAILING '.' FROM country)
FROM layoffs_staging_2
ORDER BY 1;
# One entry from US had a trailing '.', updated and removed
UPDATE layoffs_staging_2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';

SELECT `date`
FROM layoffs_staging_2;
# Date format updated
UPDATE layoffs_staging_2
SET `date` = str_to_date(`date`, '%m/%d/%Y');

ALTER TABLE layoffs_staging_2
MODIFY COLUMN `date` DATE;