# Texas Death Row Execution Analysis (SQL)

This project explores the Texas Death Row dataset using SQL to uncover trends in execution history, geographic distribution, demographics, and the recurring themes in the final statements of the executed.

## 📊 Project Highlights
- **Advanced SQL**: Utilizes Window Functions (`RANK`, `SUM OVER`), self-joins for time-series analysis, and complex string filtering (`LIKE`).
- **Thematic Analysis**: Uses text-matching to categorize final words into themes of religion, innocence, and forgiveness.
- **Geographic Insights**: Identifies the top contributing counties and their relative weight in the overall system.

## 📂 Repository Structure
- **01_queries/**
  - `basic_queries.sql`: Core dataset exploration
  - `aggregation_queries.sql`: County totals, demographics, averages
  - `conditional_queries.sql`: Thematic filtering (religion, forgiveness, innocence)
  - `window_function_queries.sql`: Rankings, cumulative totals, time-gap analysis
- **02_analysis/**: Detailed reports on findings
  - `overview.md`
  - `county_analysis.md`
  - `demographic_analysis.md`
  - `last_statement_analysis.md`

## 💡 Key Findings
- **Geography**: Harris County is the primary driver of execution numbers, significantly outstripping Dallas and Tarrant counties.
- **Demographics**: Black and Hispanic inmates are disproportionately represented; the average age at execution is late 30s.
- **Thematic Trends**: A significant majority of last statements involve spiritual references (God, prayer) or explicit requests for forgiveness, with some asserting innocence.

## 🛠️ SQL Techniques Used
- **Aggregations**: `COUNT`, `AVG`, `GROUP BY`
- **Window Functions**: `RANK() OVER`, `SUM() OVER` (cumulative totals)
- **Text Mining**: Pattern matching with `%` wildcards for sentiment and theme detection
- **Date Math**: Extracting years and calculating intervals between events

## 🚀 How to Use
- **Data**: The queries are designed for a standard SQL environment (PostgreSQL/MySQL).
- **Run**: Execute the scripts in the `/queries` folder against the Texas Death Row dataset.
- **Explore**: Review the reports in `/analysis`:
  - `overview.md` → Project objectives and techniques
  - `county_analysis.md` → Geographic distribution of executions
  - `demographic_analysis.md` → Age, race, and gender breakdown
  - `last_statement_analysis.md` → Thematic study of final statements

