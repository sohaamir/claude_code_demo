# PLANNING.md — Inspection Game Project

## Project Goal

Perform reproducible behavioural analyses on human Inspection Game data using R and Quarto, with dependency tracking via `renv` and version control via Git.

## Analysis Plan

### Phase 1: Environment & Infrastructure (current)
- [x] Create directory structure
- [x] Create .gitignore, .Rproj, _quarto.yml, README.md
- [x] Initialise Git
- [ ] Initialise renv and install packages
- [ ] Make initial commit

### Phase 2: Data Preparation
- [ ] Write `r/00_data_preparation.R`
  - Load `human_ig_data.csv`
  - Exclude subjects with < 150 valid employee responses
  - Save cleaned dataset to `data/processed/`

### Phase 3: Behavioural Analyses (`qmd/behaviour.qmd`)
- [ ] Analysis 1: Summary statistics (age, gender, trials per participant)
- [ ] Analysis 2: Effects of age group and gender on mean payoff per trial

### Phase 4: Future Analyses (TBD)
- Reinforcement learning model fits
- Fictitious play model fits
- Influence play model fits
- Model comparison

## Key Decisions
- Raw data is NEVER modified; all processing produces new objects/files
- Outputs (figures, tables) are excluded from Git (reproducible from code)
- Commit convention: `[scope]: description` (e.g., `analysis: add descriptives QMD`)
