/*Assume you're given a table containing job postings from various companies on the LinkedIn platform. 
Write a query to retrieve the count of companies that have posted duplicate job listings.

Definition:
Duplicate job listings are defined as two job listings within the same company that share identical titles and descriptions.*/

#solution
SELECT 
  count(*) as duplicate_companies
FROM
  (SELECT *,
    ROW_NUMBER() OVER(PARTITION BY company_id, title, description ORDER BY company_id) as rn
  FROM
    job_listings) a  
WHERE a.rn > 1;
