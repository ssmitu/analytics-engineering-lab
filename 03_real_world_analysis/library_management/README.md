# Local Library Management Database System

This folder contains a local PostgreSQL database modeling project that progresses from basic entity relationships to complex transactional workflows, time-series evaluations, indexing, and runtime cost optimizations.

## Directory Structure

*   **`01_schema.sql`**: Setup structural DDL objects (Tables, Keys, View definitions, Materialized structures).
*   **`02_seed_data.sql`**: Seed scripts to initialize test environments reliably.
*   **`03_core_queries.sql`**: Baseline operations covering string manipulations, primary joins, and aggregate groupings.
*   **`04_advanced_analytics.sql`**: Production logic patterns, including **Gaps and Islands** (Streak processing), self-joins, growth pipelines, and avoiding the `NOT IN` with `NULL` logically.
*   **`05_performance_tuning.sql`**: Optimizing index layouts, benchmarking query design paths using `EXPLAIN ANALYZE`, managing transactional blocks, and processing semi-structured JSONB arrays.

## Relational Architecture

The baseline system uses three interconnected primary tables and one separate semi-structured data table:

```text
  +------------------+         +------------------+         +------------------+
  |      BOOKS       |         |      LOANS       |         |     MEMBERS      |
  +------------------+         +------------------+         +------------------+
  | BookID (PK)      |<--------| BookID (FK)      |         | MemberID (PK)    |
  | Title            |         | MemberID (FK) |--->| Name             |
  | Author           |         | LoanID (PK)      |         | JoinDate         |
  | PublishedYear    |         | LoanDate         |         +------------------+
  | Price            |         | ReturnDate       |
  +------------------+         +------------------+