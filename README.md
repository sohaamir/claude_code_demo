# Inspection Game Behavioural Analysis

## Study Overview

This project analyses human behaviour in the **Inspection Game**, a two-player economic game in which participants took the role of an *employee* facing a computer-controlled *employer*. On each of 150 trials, the employee chose to **work** or **shirk**, while the employer simultaneously chose to **inspect** or **not inspect**. Payoffs were determined by the combination of both players' choices.

The study investigates the strategies humans adopt — including reinforcement learning, fictitious play (predicting and countering the opponent's next move), and influence play (shaping the opponent's expectations) — and how these vary across age groups and demographic variables.

---

## Reproducing the Analysis

### 1. Restore the R environment

Open the project in RStudio (double-click `claude_code_demo.Rproj`) or set your working directory to the project root, then run:

```r
renv::restore()
```

This installs all packages at the exact versions recorded in `renv.lock`.

### 2. Render all analyses

From the terminal in the project root:

```bash
quarto render
```

This renders all `.qmd` documents and writes output to `_site/`.

---

## Folder Structure

```
claude_code_demo/
├── CLAUDE.md                  # Agent instructions and project spec
├── README.md                  # This file
├── .gitignore
├── human_ig_data.csv          # Raw data — do not modify
├── renv.lock                  # Pinned package versions
├── renv/                      # renv infrastructure
├── claude_code_demo.Rproj     # RStudio project file
├── _quarto.yml                # Quarto project configuration
│
├── data/
│   └── processed/             # Cleaned/derived datasets
│
├── r/
│   └── 00_data_preparation.R  # Data cleaning script
│
├── qmd/
│   └── behaviour.qmd          # Behavioural analyses
│
└── outputs/
    ├── figures/               # Saved plots (ggsave)
    └── tables/                # Saved tables
```

---

## Contact

**Lead Researcher:** [Name]
**Email:** [email@institution.edu]
**Institution:** [Institution name]
