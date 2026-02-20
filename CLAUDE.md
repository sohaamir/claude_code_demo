# CLAUDE.md — Inspection Game Behavioural Analysis Project

This file provides instructions for Claude Code when setting up, structuring, and running analyses for this project. Read this file carefully and in full before taking any action.

---

## Agent Behaviour Guidelines

Before doing anything else, read and internalise these operating principles:

- **Think deeply before acting.** Before writing any code, creating any file, or running any command, reason through the full plan. Consider whether the action is necessary, whether it might have unintended consequences, and whether there is a simpler approach.
- **Keep running costs minimal.** Avoid redundant operations, unnecessary package installations, or re-running expensive computations. Prefer incremental, targeted actions over broad sweeps. Do not re-render the entire project when only one script has changed.
- **Ask for guidance when uncertain.** If an instruction is ambiguous, if the data structure does not match expectations, or if a planned analysis could be interpreted in more than one reasonable way — stop and ask for clarification rather than guessing. It is always better to pause than to proceed incorrectly.
- **Do not silently skip steps.** If something cannot be completed (e.g., a package fails to install, a variable is missing), report it clearly and wait for instruction.
- **Preserve raw data.** Never overwrite or modify `human_ig_data.csv`. All data processing must produce new objects or files.
- **Be transparent.** When making non-trivial decisions (e.g., how to operationalise a variable, how to handle missing data), briefly explain the rationale in a code comment or inline note.
- **Commit incrementally.** After completing each logical unit of work (environment setup, one analysis script, etc.), make a descriptive Git commit. Do not batch everything into a single commit.

---

## Project Overview

**Study design:** A behavioural task where humans played the 'Inspection game'. The inspection game consists two players, the 'employee' and the 'employee'. In our study, humans always assumed the role of the employee. On each trial, humans had to make a decision whether to 'work' or 'shirk'. The opponent (a computer algorithm) as the employer also has to make a decision whether to 'inspect' or 'not inspect' at the same time. Players are rewarded according to the following payoff matrix:

If the employer chooses not inspect and the employee chooses work, the employer earns 100 cents, and the employee earns 0 cents.
If the employer chooses inspect and the employee chooses work, the employer earns 0 cents, and the employee earns 50 cents.
If the employer chooses not inspect and the employee chooses shirk, the employer earns 0 cents and the employee earns 50 cents.
If the employer chooses inspect and the employee chooses shirk, the employer earns 25 cents, and the employee earns 0 cents.

On each trial, players:

1. Chose whether to 'work' or shirk',
2. The opponent (an algorithm) chooses to 'inspect' or not inspect'
3. Both players receive an payoff in accordance with the matrix described above
4. Players then move onto the next trial

In total, 150 trials are played between the human and computer algorithm. The idea is that the human can engage in various strategies, reinforcement learning, fictitious play (where they predict the action of the opponent and counter accordingly), and influence play (where the player forms a prediction of what the opponent expects for them to choose, and counters this prediction).

**Goal:** Perform reproducible behavioural analyses in R using Quarto markdown documents, with dependency tracking via `renv` and version control via GitHub.

**Raw data file:** `human_ig_data.csv` (located in the project root).

---

## Repository Structure

Set up the repository to follow this structure. Create any missing directories and placeholder files as needed:
```
claude_code_demo/
├── CLAUDE.md                  # This file
├── README.md                  # Project overview for GitHub
├── .gitignore                 # R/RStudio/renv-appropriate ignores
├── human_ig_data.csv          # Raw data — DO NOT MODIFY
├── renv.lock                  # Managed by renv
├── renv/                      # Managed by renv
├── claude_code_demo.Rproj     # RStudio project file
│
├── data/
│   └── processed/             # Cleaned/derived datasets saved here
│
├── r/
│   └── 00_data_preparation.R  # Standalone data cleaning script
│
├── qmd/
│   ├── behaviour.qmd          # Behavioural analyses performed on subsetted data
│   └── ...
│
├── outputs/
│   ├── figures/               # All saved plots
│   └── tables/                # All saved tables
│
└── _quarto.yml                # Quarto project configuration
```

---

## Environment Setup

### 1. Git Initialisation

- Initialise a Git repository in the project root if one does not already exist.
- Create a `.gitignore` appropriate for an R project. At minimum, exclude:
  - `.Rhistory`, `.RData`, `.Rproj.user/`
  - `renv/library/`, `renv/staging/`
  - `outputs/` (figures and tables are reproducible, not tracked by default — confirm with user if this should change)
  - Any `.html` or `_files/` directories produced by Quarto rendering
- Make an initial commit with the raw data and this CLAUDE.md.

### 2. RStudio Project

- Create a `.Rproj` file named `claude_code_demo.Rproj` in the project root with sensible defaults (UTF-8 encoding, restore workspace: No, save workspace: No).

### 3. Dependency Management with renv

- Initialise `renv` in the project: `renv::init()`
- After installing all required packages (see below), snapshot the environment: `renv::snapshot()`
- The `renv.lock` file must be committed to Git so the environment is fully reproducible.
- When adding new packages during analysis, always run `renv::snapshot()` afterwards and commit the updated lockfile.

### 4. Required R Packages

Install and track the following packages at minimum. Add others as needed for specific analyses:

**Core workflow:**
- `tidyverse` (data wrangling and plotting)
- `quarto` (document rendering)
- `here` (reproducible file paths)
- `renv` (dependency management)

**Data manipulation:**
- `dplyr`, `tidyr`, `purrr`, `stringr` (all within `tidyverse`)
- `janitor` (variable name cleaning)

**Visualisation:**
- `ggplot2` (within `tidyverse`)
- `patchwork` (combining plots)
- `scales`

**Reporting:**
- `knitr`, `kableExtra` (tables in Quarto)
- `gt` (publication-quality tables, optional)

### 5. Quarto Configuration

Create a `_quarto.yml` file in the project root:
```yaml
project:
  type: website
  output-dir: _site

format:
  html:
    theme: cosmo
    toc: true
    toc-depth: 3
    code-fold: true
    code-tools: true
    embed-resources: true
    df-print: paged

execute:
  warning: false
  message: false
  cache: true
```

---

## Key Variables

Refer to this section when writing data preparation and analysis code. This is not exhaustive — consult the raw data structure as needed.

- `id` - the id number for each participant
- `group` - the group that the participant is in (1 for `young`, 2 for `old`)
- `choice` - the binary choice made by the human employee (0 for shirk, 1 for work)
- `opchoice` - the binary choice made by the computer algorithm employer (0 for not inspect, 1 for inspect)
- `trial` - the trial number played (max 150)
- `age` - the age in years for the human employee subject
- `gender` - the gender for the human employee subject (1 for male, 2 for female)
---

## Data Preparation (`scripts/00_data_preparation.R`)

This script should perform basic preprocessing of the data. This includes:

1. Removing any subjects with less than 150 trials where there are valid employee responses

Do not perform statistical analyses in this script.

---

## Analysis Scripts

All analyses should be contained within a single Quarto document in `analysis/`. Follow this template structure:
```
---
title: "XX — [Name]"
author: "[Author]"
date: today
format: html
---

## Overview
Brief description of what the analyses address.

## Setup
Load packages, source the pre-processed data.

## Analyses
Code chunks for the analyses.
```

All figures should be saved to `outputs/figures/` using `ggsave()` with explicit width, height, and dpi. All tables should be saved to `outputs/tables/`.

---

## Planned Analyses

1. Basic summary statistics for all data variables, i.e., age, gender, number of trials per participant
2. Basic effects of age and gender on mean payoff per trial (excluding missing trials)

Separate each of these into a discrete code chunk within the main Qmd script, and print the plots within the document. 

---

## README.md

When creating the `README.md`, include:

- A brief lay description of the study and its aims
- Instructions for restoring the environment: `renv::restore()`
- Instructions for rendering all analyses: `quarto render`
- A description of the folder structure
- A placeholder for lead researcher contact information

---

## GitHub Setup

- Initialise the repository locally with `git init` if not already done.
- Create a `.gitignore` as described in the Git Initialisation section above.
- Make an initial commit containing at minimum: `CLAUDE.md`, `human_ig_data.csv`, `README.md`, `.gitignore`, and the `.Rproj` file.
- Add a remote origin only once the user explicitly provides a GitHub repository URL.
- Do not push to remote until the user confirms the repository exists and the remote has been added correctly.
- Use descriptive commit messages following this convention: `[scope]: description`
  - Examples: `setup: initialise renv environment`, `data: add preparation script`, `analysis: add descriptives QMD`

---

## Workflow

You should also create the following files in the project root when first setting up the project, and each should be updated when prompted by the user accordingly:

- PLANNING.md - information related to the planning and execution of the project
- TASKS.md - a detailed list of the tasks to be accomplished in the project
- SCRATCHPAD.md - a place for you (the assistant) to keep notes on your ongoing work

Together with the CLAUDE.md, these are collectively known as the 'config files'. Therefore, if the user prompts to 'update config' then you should update all four files accordingly.