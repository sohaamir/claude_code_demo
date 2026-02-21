# SCRATCHPAD.md — Working Notes

## Session 2: Environment, Data Prep, and Analyses (2026-02-21)

### Completed
- renv initialised (bare), 120 packages installed, lockfile committed
- Data prep script written and verified: 83 excluded, 67 retained (10,050 rows)
- behaviour.qmd written, rendered, and committed
- All outputs saved to outputs/figures/ and outputs/tables/

### Key Findings (descriptive)
- 67 participants with complete 150 trials retained (83 excluded)
- Participants split into "young" (group 1) and "old" (group 2)
- Figures and tables saved to outputs/ (gitignored, reproducible from code)

### Technical Note
- scales::col_factor() masked readr::col_factor() — fixed by using readr::col_factor() explicitly in read_csv() call inside behaviour.qmd

---

## Session 1: Initial Project Setup

### Data Structure Notes
- `human_ig_data.csv`: 22,248 data rows + 1 header = ~22,249 lines
- Columns: id, group, choice, opchoice, payoff, trial, age, gender
- First participant: id=101, group=1 (young), age=24, gender=2 (female)
- Max trials per participant: 150
- Estimated ~148 participants (22,248 / 150 ≈ 148.3)

### Exclusion Criteria
- Remove subjects with < 150 valid employee choice responses
- "Valid" = non-missing `choice` value
- Will verify actual trial counts in data prep script

### Package Notes
- `tidyverse` covers: dplyr, tidyr, purrr, stringr, ggplot2
- Additional installs needed: janitor, patchwork, scales, knitr, kableExtra, gt, here, quarto

### Ambiguities Resolved
- Repo structure diagram (`r/`, `qmd/`) takes precedence over section headings (`scripts/`, `analysis/`)
- outputs/ is excluded from Git per .gitignore (reproducible from code)

### Open Questions
- GitHub remote URL: not yet provided by user — do not push until confirmed
