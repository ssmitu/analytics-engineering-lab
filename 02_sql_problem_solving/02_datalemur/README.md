# DataLemur SQL Solutions Directory

This folder serves as a structured repository of my solutions to interview-style SQL challenges on [DataLemur](https://datalemur.com/). These problems simulate real-world data tracking, analytics, and business intelligence scenarios from major technology companies.

## Directory Structure

The directory is organized by difficulty. As I continue to solve problems, new solutions are added directly to these folders without requiring updates to this documentation:

*   **[`/easy/`](./easy/)**: Foundational operations focusing on primary filters, pattern matching, joins, and basic aggregate groupings.
*   **[`/medium/`](./medium/)**: Intermediate-level operations introducing window functions, chronological rolling averages, database pivoting, and sequential data swaps.
*   **[`/hard/`](./hard/)**: Advanced-level challenges testing complex relational logic, combinatorics, cohort retention tracking, and gaps & islands patterns (streaks).

## Code & Documentation Standard

To keep this repository clean and easy to navigate, every `.sql` file follows a uniform standard:
1.  **Code First:** The working SQL query is located at the top of the file for immediate execution.
2.  **Metadata & Context:** The target company, platform name, and original problem link are included in the header.
3.  **Thinking Process:** My logical breakdown and approach to solving the problem are documented inside a multi-line comment block (`/* ... */`) at the very bottom of the file.

---

## Technical Skills Showcased

The solutions in this directory demonstrate proficiency in several key areas of database query design and analytical engineering:

### 1. Data Aggregation & Transformation
*   **Logical Pivoting:** Consolidating transactional rows into columnar formats using conditional aggregation.
*   **Custom Date/Time Math:** Extracting temporal dimensions, measuring time intervals, and standardizing timestamps.
*   **String Manipulation & Parsing:** Cleaning, formatting, and joining text attributes to generate clean dimensions.

### 2. Analytical Window Functions
*   **Sequence & Ranking:** Segmenting and ranking rows using partitioning and sorting rules.
*   **Time-Series Analysis:** Computing sliding averages, rolling aggregates, and calculating value deltas over chronological events.
*   **Relative Lookups:** Retrieving offset values from preceding or succeeding rows within logical partitions.

### 3. Advanced Relational Logic
*   **Complex Joining Patterns:** Resolving multi-layered relationships using self-joins, inequality joins, and exclusion left-joins.
*   **Mathematical Sequence Analysis (Gaps & Islands):** Identifying consecutive behavior patterns, continuous login streaks, or transactional gaps.
*   **Cohort Tracking:** Building query pipelines to measure user retention, churn, and reactivation behaviors over discrete operational windows.