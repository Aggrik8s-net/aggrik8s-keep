# aggrik8s-keep
## Purpose
Aggrik8s needs a data storage service.

We will use [Dolt](https://github.com/dolthub/dolt) to build the cyber equivalent of a mid-evil castle's `Keep`.

## Description
The blog [So you want Database Versioning?](https://www.dolthub.com/blog/2022-08-04-database-versioning/#dolt) describes and compares several Open Source version controlled databases.
The authors of the blog summarize their offering as follows:

> Dolt takes “Database Versioning” rather literally. Dolt implements the Git command line and associated operations on table rows instead of files. Data and schema are modified in the working set using SQL. When you want to permanently store a version of the working set, you make a commit. In SQL, Dolt implements Git read operations (ie. diff, log) as system tables and write operations (ie. commit, merge) as functions or stored procedures. Dolt produces cell-wise diffs and merges, making data debugging between versions tractable. That makes Dolt the only SQL database on the market that has branches and merges. You can run Dolt offline, treating data and schema like source code. Or you can run Dolt online, like you would PostgreSQL or MySQL.

## Status
1. ~~Existing Artifacts to provision a working Dolt cluster~~ [Commit 312015c](https://github.com/Aggrik8s-net/aggrik8s-keep/commit/312015c37cbe9f86b62e5f1d2ddd35662fe90939).
2. Work through Dolt tutorials and documentation (in progress),
3. Develop GO code as initial test harness to exercise Dolt features,
4. Develop an operator to package findings as consumable tooling (TBD).
5. 