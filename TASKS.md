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
- [~] Initialise Git repository
- [ ] Initialise renv (`renv::init()`)
- [ ] Install required R packages
- [ ] Snapshot renv (`renv::snapshot()`)
- [ ] Make initial Git commit

## Data Tasks

- [ ] Write `r/00_data_preparation.R`
  - [ ] Load raw data
  - [ ] Exclude subjects with < 150 valid trials
  - [ ] Save cleaned data to `data/processed/`
- [ ] Commit data preparation script

## Analysis Tasks

- [ ] Create `qmd/behaviour.qmd`
  - [ ] Setup chunk (load packages, load processed data)
  - [ ] Analysis 1: Summary statistics (age, gender, trials per participant)
  - [ ] Analysis 2: Age group and gender effects on mean payoff per trial
  - [ ] Save all figures to `outputs/figures/`
  - [ ] Save all tables to `outputs/tables/`
- [ ] Commit analysis QMD

## Future Tasks (User-Directed)

- [ ] Computational model fitting (RL, fictitious play, influence play)
- [ ] Model comparison analyses
- [ ] Push to remote GitHub repository (requires user to provide URL)
