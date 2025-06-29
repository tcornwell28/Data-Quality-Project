-- This script deals with nulls and blanks in the data

SELECT *
FROM layoffs_staging_2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

# Changes all blank values in industry to null values
UPDATE layoffs_staging_2
SET industry = NULL
WHERE industry = '';

SELECT *
FROM layoffs_staging_2
WHERE industry IS NULL
OR industry = '';

SElECT *
FROM layoffs_staging_2
WHERE company = 'Airbnb';

SELECT t1.industry, t2.industry
FROM layoffs_staging_2 t1
JOIN layoffs_staging_2 t2
	ON t1.company = t2.company
WHERE (t1.industry IS NULL OR t1.industry = '')
AND t2.industry IS NOT NULL;

# Gets rid of null values in industry
UPDATE layoffs_staging_2 t1
JOIN layoffs_staging_2 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;

SELECT *
FROM layoffs_staging_2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

# Removes data where total_laid_off and percentage_laid_off columns are both null
DELETE
FROM layoffs_staging_2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

SELECT *
FROM layoffs_staging_2;

# Drops row_num column from the staging table
ALTER TABLE layoffs_staging_2
DROP COLUMN row_num;