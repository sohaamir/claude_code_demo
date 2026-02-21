# PLANNING.md — Inspection Game Project

## Project Goal

Perform reproducible behavioural analyses on human Inspection Game data using R and Quarto, with dependency tracking via `renv` and version control via Git.

## Analysis Plan

### Phase 1: Environment & Infrastructure ✓
- [x] Create directory structure
- [x] Create .gitignore, .Rproj, _quarto.yml, README.md
- [x] Initialise Git
- [x] Initialise renv and install packages (120 packages, renv.lock committed)
- [x] Commits: `setup: initialise renv environment`

### Phase 2: Data Preparation ✓
- [x] Write `r/00_data_preparation.R`
  - Loaded `human_ig_data.csv` (22,248 rows, 150 participants)
  - Excluded 83 participants with < 150 valid employee-choice rows
  - Saved cleaned dataset to `data/processed/ig_data_clean.csv` (67 participants)
- [x] Commit: `data: add preparation script`

### Phase 3: Behavioural Analyses ✓
- [x] Analysis 1: Summary statistics (age, gender, trials) — Figure 1 + Tables 1–2
- [x] Analysis 2: Mean payoff by group and gender — Figure 2 + Table 3
- [x] Commit: `analysis: add descriptives QMD`

### Phase 4: Future Analyses (TBD)
- Reinforcement learning model fits
- Fictitious play model fits
- Influence play model fits
- Model comparison

## Key Decisions
- Raw data is NEVER modified; all processing produces new objects/files
- Outputs (figures, tables) are excluded from Git (reproducible from code)
- Commit convention: `[scope]: description` (e.g., `analysis: add descriptives QMD`)
