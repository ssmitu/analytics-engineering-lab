## Data Modification & Schema Operations – Thinking Process Notes

This section focuses on SQL operations that modify database data and structure.

Unlike previous sections that mainly focused on retrieving and analyzing data, these queries deal with maintaining databases by:
- inserting new records
- updating existing information
- deleting data
- creating and modifying tables

These operations are important for understanding how databases are managed in real-world systems.

---

### 1. Inserting a new movie record

**Goal:**  
Add a new movie into the movies table.

**My thinking:**  
The `INSERT INTO` statement allows new rows to be added directly into a table.

This query helped me understand how new records are inserted while following the existing table structure and column ordering.

---

### 2. Updating incorrect director information

**Goal:**  
Correct the director for an existing movie.

**My thinking:**  
`UPDATE` is used when existing records contain incorrect or outdated information.

Using a `WHERE` condition ensures that only the intended row is modified instead of accidentally updating the entire table.

This reinforced the importance of precise filtering during modification operations.

---

### 3. Updating multiple columns simultaneously

**Goal:**  
Correct both the title and director of a movie.

**My thinking:**  
A single `UPDATE` statement can modify multiple columns at once.

This query demonstrated how SQL can efficiently handle multiple field corrections within the same record.

---

### 4. Deleting old movie records

**Goal:**  
Remove movies released before 2005.

**My thinking:**  
`DELETE` removes rows that satisfy a condition.

Using a `WHERE` clause is critical because deleting without conditions could remove all records from the table.

This query highlighted how destructive operations require careful filtering logic.

---

### 5. Creating a new table

**Goal:**  
Create a new database table with custom columns.

**My thinking:**  
`CREATE TABLE` defines a completely new table structure, including column names and data types.

This helped me understand how databases are designed at the schema level rather than only interacting with existing data.

---

### 6. Modifying table structure with ALTER TABLE

**Goal:**  
Add a language column with a default value.

**My thinking:**  
`ALTER TABLE` allows existing database structures to be modified without recreating the table.

Adding a default value ensures that newly inserted rows automatically receive a value unless explicitly specified.

This query introduced the idea of evolving database schemas over time.

---

### 7. Dropping a table

**Goal:**  
Remove the movies table entirely.

**My thinking:**  
`DROP TABLE` permanently removes both the table structure and its stored data.

This operation demonstrated the difference between deleting rows and removing an entire schema object from the database.

---

## Key Takeaway

This section introduced the operational side of SQL beyond querying data.

The main learning was understanding how SQL is also used to:
- maintain records
- correct data
- manage schemas
- evolve database structures over time

These operations form the foundation of CRUD workflows and database administration basics.