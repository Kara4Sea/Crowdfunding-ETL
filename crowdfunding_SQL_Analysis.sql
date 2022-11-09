-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 

-- SELECT COUNT(ba.cf_id), ca.cf_id
-- FROM backers as ba
-- LEFT JOIN campaign as ca
-- ON ba.cf_id = ca.cf_id
-- GROUP BY ca.cf_id DESC;

-- SELECT COUNT(cf_id), cf_id
-- -- INTO backer_counts
-- FROM backers
-- GROUP BY cf_id
-- ORDER BY count DESC;

SELECT (backers_count), cf_id
FROM campaign
WHERE outcome = 'live'
ORDER BY backers_count DESC;


-- SELECT (end_date), cf_id
-- FROM campaign
-- ORDER BY end_date DESC;

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.

SELECT COUNT(cf_id), cf_id
-- INTO backer_counts
FROM backers
GROUP BY cf_id
ORDER BY count DESC;


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 

SELECT first_name, last_name, email, (goal - pledged) AS "Remaining Goal Amount"
INTO email_contacts_remaining_goal_amount
FROM contacts as ct
JOIN campaign as c
ON ct.contact_id = c.contact_id
WHERE outcome = 'live'
ORDER BY (goal - pledged) DESC;






-- SELECT cf_id, goal, pledged, (goal - pledged)
-- -- INTO email_contacts_remaining_goal_amount
-- FROM campaign
-- -- WHERE (goal - pledged) = "Remaining_Goal_Amount"
-- WHERE (goal - pledged) >0
-- ORDER BY (goal - pledged) DESC;

-- SELECT * FROM email_contacts_remaining_goal_amount;

-- ALTER TABLE email_contacts_remaining_goal_amount
-- RENAME COLUMN column TO Remaining Goal Amount;

-- Joining departments and dept_manager tables
-- SELECT backers.first_name,
--      backers.last_name,
--      backers.email,
--      dept_manager.to_date
-- FROM departments
-- INNER JOIN dept_manager
-- ON departments.dept_no = dept_manager.dept_no;


-- Check the table


-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 

SELECT email,first_name, last_name, c.cf_id, 
company_name, description, end_date, (goal - pledged) AS "Left of Goal"
INTO email_backers_remaining_goal_amount
FROM backers as b
JOIN campaign as c
ON b.cf_id = c.cf_id
WHERE outcome = 'live'
ORDER BY (last_name, email);

-- Check the table


