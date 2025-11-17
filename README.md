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
  Contains the 10 benchmark queries (Q1–Q10) used in the experiments.

### Full dataset (hosted externally)

The full PerfectPet CSV data is available here:

👉 **Full PerfectPet Data (Google Drive)**  
https://drive.google.com/drive/folders/14uzlaAoakl28Gm22awr82gJQaXOVDAPd?usp=sharing

These files are identical to the dataset used in the Hologram experiments and
include all tables necessary to reproduce the joins in Q1–Q10.


### `tpch`

TPC-H benchmark schema for testing Hologram on a realistic multi-table setting.

- Data: `data/tpch/`
- Queries: `data/tpch/queries/`
