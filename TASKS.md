# TASKS.md — Inspection Game Project

## Status Key
- `[ ]` Pending
- `[~]` In progress
- `[x]` Complete

---

## Setup Tasks

- [x] Create directory structure (`data/processed`, `r/`, `qmd/`, `outputs/figures`, `outputs/tables`)
- [x] Create `.gitignore`
- [x] Create `claude_code_demo.Rproj`
- [x] Create `_quarto.yml`
- [x] Create `README.md`
- [x] Create config files (`PLANNING.md`, `TASKS.md`, `SCRATCHPAD.md`)
- [x] Initialise Git repository
- [x] Initialise renv (`renv::init()`)
- [x] Install required R packages
- [x] Snapshot renv (`renv::snapshot()`)
- [x] Commit renv lockfile (`setup: initialise renv environment`)

## Data Tasks

- [x] Write `r/00_data_preparation.R`
  - [x] Load raw data (22,248 rows, 150 participants)
  - [x] Exclude 83 subjects with < 150 valid trials
  - [x] Save cleaned data to `data/processed/ig_data_clean.csv` (67 participants, 10,050 rows)
- [x] Commit data preparation script (`data: add preparation script`)

## Analysis Tasks

- [x] Create `qmd/behaviour.qmd`
  - [x] Setup chunk (load packages, load processed data)
  - [x] Analysis 1: Summary statistics (age, gender, trials per participant)
  - [x] Analysis 2: Age group and gender effects on mean payoff per trial
  - [x] Save all figures to `outputs/figures/`
  - [x] Save all tables to `outputs/tables/`
- [x] Commit analysis QMD (`analysis: add descriptives QMD`)

## Future Tasks (User-Directed)

- [ ] Computational model fitting (RL, fictitious play, influence play)
- [ ] Model comparison analyses
- [ ] Push to remote GitHub repository (requires user to provide URL)
