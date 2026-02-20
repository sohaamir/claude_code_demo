# SCRATCHPAD.md — Working Notes

## Current Session: Initial Project Setup

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
