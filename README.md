# Data-Quality-Project

This project demonstrates cleaning and standardizing real world data using SQL. The dataset tracks global company layoffs and contains common data quality issues such as duplicates, inconsistent formatting, blank fields, and invalid values.

## Cleaning Techniques Applied

Removed duplicate records using ROW_NUMBER() and window functions
Standardized text fields with TRIM() and consistent naming conventions
Corrected inconsistent values in industry and coutnry fields
Reformatted date fields into a consistent date format
Handled null or blank values and imputed missing industry fields based on company
Removed incomplete records where appropriate

---

## Tools Used

- SQL
- Public layoff dataset

## Notes

- The SQL scripts were developed using MySQL syntax. 
