-- Platform: DataLemur
-- Company: Snowflake
-- Problem: Marketing Touch Streak
-- URL: https://datalemur.com/questions/marketing-touch-streak

WITH touches AS (
    SELECT contact_id,
           EXTRACT(YEAR FROM event_date) AS year_filing,
           EXTRACT(WEEK FROM event_date) AS week_filing,
           ROW_NUMBER() OVER (
               PARTITION BY contact_id
               ORDER BY EXTRACT(YEAR FROM event_date), EXTRACT(WEEK FROM event_date)
           ) AS seq
    FROM marketing_touches
),
streaks AS (
    SELECT contact_id,
           year_filing,
           week_filing,
           (year_filing * 52 + week_filing) - seq AS streak_id
    FROM touches
),
qualified_streaks AS (
    SELECT contact_id,
           COUNT(*) AS weeks_in_streak
    FROM streaks
    GROUP BY contact_id, streak_id
    HAVING COUNT(*) >= 3
),
trial_contacts AS (
    SELECT DISTINCT contact_id
    FROM marketing_touches
    WHERE event_type = 'trial_request'
)
SELECT DISTINCT c.email
FROM crm_contacts c
INNER JOIN qualified_streaks qs ON c.contact_id = qs.contact_id
INNER JOIN trial_contacts tc ON c.contact_id = tc.contact_id;

/*
Thinking Process:
1. Identify contact emails of users with consecutive marketing touches over 3 or more weeks, who also have a trial request event.
2. Group and extract chronological week values from the event date inside CTE 'touches'.
3. In CTE 'streaks', convert years and weeks to a single linear absolute week index: (year * 52 + week). 
4. Subtract the row sequence ID (seq) from this linear index. Consistent consecutive weekly contact events will evaluate to a shared streak_id.
5. Aggregate by contact and streak ID, filtering for groups >= 3 consecutive weeks.
6. Join these qualified marketing contacts with contacts who explicitly made a 'trial_request' to retrieve emails.
*/