# Overview of Texas Death Row Dataset Analysis

This project uses SQL to analyze execution data from Texas Death Row.

## Objectives
- Understand execution trends over time
- Analyze geographic distribution (counties)
- Study demographic patterns (race, gender, age)
- Examine last statement themes (religion, forgiveness, prayer, innocence claims)
- Explore cumulative execution counts with window functions

## SQL Techniques Used
- Aggregation (`COUNT`, `GROUP BY`) for county, race, and gender totals
- Conditional filtering (`WHERE`, `LIKE`) for thematic last statements
- Window functions (`RANK`, `SUM OVER`) for ranking counties and cumulative totals
- Self JOIN for time gap analysis between executions
