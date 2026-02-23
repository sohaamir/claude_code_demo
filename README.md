# Using Claude Code for Behavioural Data Analysis

A demonstration of how **Claude Code** — Anthropic's agentic AI coding tool — can set up, structure, and run a complete behavioural data analysis pipeline from scratch, with minimal user input.

The analysis uses data from the **Inspection Game**, a two-player economic task in which human participants chose to *work* or *shirk* against a computer-controlled employer over 150 trials.

---

## What This Repository Demonstrates

This repository shows the difference between interacting with an AI coding assistant **without** and **with** structured project context — and then letting it autonomously execute a full analysis workflow.

---

## Getting Started with Claude Code

### Installation

Claude Code runs in your terminal and requires [Node.js](https://nodejs.org/) (v18+).

```bash
npm install -g @anthropic/claude-code
```

Then authenticate:

```bash
claude
```

Follow the prompts to log in with your Anthropic account.

### Useful Commands

Once inside a Claude Code session, use these built-in slash commands:

| Command | Description |
|---|---|
| `/model` | Show or switch the current model |
| `/usage` | View token usage for the current session |
| `/context` | Show what context (files, memory) is loaded |
| `/clear` | Clear the conversation and start fresh |
| `/help` | List all available commands |
| `/quit` | Exit the session |

---

## The Demonstration Workflow

### Step 1 — Ask Claude about the repository (no context)

Start with a bare-bones project containing only the raw data file `human_ig_data.csv`. Open a Claude Code session in the project directory:

```bash
cd your-project-folder
claude
```

Then ask:

`What does this repository contain, and what analyses could I run on this data?`

Claude will give a generic response — it can inspect the CSV and make inferences, but it has no knowledge of the study design, variable names, planned analyses, or preferred tools.

---

### Step 2 — Add the CLAUDE.md and ask again

Copy the provided `CLAUDE.md` template into the project root. This file contains structured instructions about the study design, repository layout, required packages, planned analyses, and agent behaviour guidelines.

Then ask the same question:

`What does this repository contain, and what analyses could I run on this data?`

This time Claude's response will be substantially more informed — it now understands the payoff matrix, the roles of each variable, the analysis goals, and how the project should be structured.

---

### Step 3 — Ask Claude to execute the full workflow

With `CLAUDE.md` in place, ask Claude to work through the project setup and analyses autonomously:

`Please work through all of the tasks described in CLAUDE.md`

Claude will then execute a multi-step agentic workflow, including:

- Initialising the repository structure (folders, config files)
- Setting up the R environment with `renv`
- Writing a data preparation script (`r/00_data_preparation.R`)
- Creating a Quarto analysis document (`qmd/behaviour.qmd`)
- Running the analyses and saving outputs
- Making descriptive Git commits at each stage

---

### Step 4 — Update project config at the end of a session

The project uses four **config files** to track context, plans, and progress across sessions:

| File | Purpose |
|---|---|
| `CLAUDE.md` | Core instructions and project specification |
| `PLANNING.md` | Planning notes and decisions |
| `TASKS.md` | Task list and current status |
| `SCRATCHPAD.md` | Agent working notes |

At the end of each session — or whenever the project state has meaningfully changed — prompt Claude to refresh all four files at once:

`update config`

Claude will update all four config files to reflect the current state of the project, ensuring continuity across sessions.

---

## What Gets Generated

Running through the full workflow produces the following:

```
claude_code_demo/
├── CLAUDE.md                     # Project instructions for Claude
├── PLANNING.md                   # Project planning notes (agent-generated)
├── TASKS.md                      # Task list (agent-generated)
├── SCRATCHPAD.md                 # Agent working notes
├── README.md                     # This file
├── .gitignore                    # R/Quarto-appropriate ignores
├── human_ig_data.csv             # Raw data — do not modify
├── renv.lock                     # Pinned R package versions
├── renv/                         # renv infrastructure
├── claude_code_demo.Rproj        # RStudio project file
├── _quarto.yml                   # Quarto project configuration
│
├── data/
│   └── processed/
│       └── ig_data_clean.csv     # Cleaned dataset (participants with 150 valid trials)
│
├── r/
│   └── 00_data_preparation.R     # Data cleaning script
│
├── qmd/
│   └── behaviour.qmd             # Behavioural analyses (descriptives + age/gender effects)
│
└── outputs/
    ├── figures/                  # All plots saved via ggsave()
    └── tables/                   # Summary tables
```

### Analyses Produced

The `behaviour.qmd` document contains two discrete analyses:

1. **Descriptive statistics** — summary of participant age, gender, and trial counts
2. **Age and gender effects on payoff** — mean payoff per trial broken down by group and gender

---

## Contact

**Lead Researcher:**
Aamir Sohail

**Email:**
axs2210@student.bham.ac.uk

**Institution:**
University of Birmingham
