# Hologram: Human-Guided Reinforcement Learning for Knowledge Graph Maintenance

This repository contains the datasets and SQL queries used in the Hologram experiments.

## Datasets

## PerfectPet Dataset

The PerfectPet benchmark is used in the Hologram experiments to test a variety
of join patterns.

This repository **does not include CSV data** because several tables exceed
GitHub’s 100MB file limit.

### Files included

- `data/perfect_pet/queries/perfect_pet_queries.sql`  
  Contains the 9 benchmark queries (Q1–Q9) used in the experiments.

### Full dataset (hosted externally)

The full PerfectPet CSV data is available here:

👉 **Full PerfectPet Data (Google Drive)**  
https://drive.google.com/drive/folders/14uzlaAoakl28Gm22awr82gJQaXOVDAPd?usp=sharing

These files are identical to the dataset used in the Hologram experiments and
include all tables necessary to reproduce the joins in Q1–Q10.


## TPC-H dataset (SQLite / CSV)

The TPC-H benchmark is used in Hologram to evaluate join path selection and
query behavior on a realistic decision-support schema.

This repository only contains the **queries** used in our experiments:

- `data/tpch/queries/` – TPC-H SQL queries 

The actual TPC-H data is **not stored in this repository**. It is exported from
our local SQLite database as CSV files and hosted externally on Google Drive:

👉 **Full TPC-H CSV data**  
https://drive.google.com/drive/folders/1vp1YN8_1d9xVAdwxJQkjSEkHrFTAhfpl

To reproduce the experiments:

1. Download the CSV files from the link above.
2. Either:
   - import them into your own database system, or
   - recreate a local SQLite database and point Hologram to it.

