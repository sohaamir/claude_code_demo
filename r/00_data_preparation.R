# =============================================================================
# 00_data_preparation.R
# Inspection Game — Data Cleaning and Preprocessing
# =============================================================================
# Purpose: Load raw data, apply exclusion criteria, and save a cleaned
#          dataset to data/processed/ for use in all downstream analyses.
#
# Exclusion criterion:
#   Participants with fewer than 150 valid employee choice responses are
#   removed. "Valid" is defined as a non-missing value in the `choice`
#   column. Because the raw data contains no NAs in `choice`, the valid
#   trial count equals the total row count per participant. Participants
#   with < 150 rows are therefore excluded.
#
# Raw data is never modified — this script only produces new objects/files.
# =============================================================================

library(tidyverse)
library(here)
library(janitor)

# -----------------------------------------------------------------------------
# 1. Load raw data
# -----------------------------------------------------------------------------
raw <- read_csv(
  here("human_ig_data.csv"),
  col_types = cols(
    id       = col_integer(),
    group    = col_integer(),
    choice   = col_integer(),
    opchoice = col_integer(),
    payoff   = col_double(),
    trial    = col_integer(),
    age      = col_double(),
    gender   = col_integer()
  )
)

cat("Raw data loaded:", nrow(raw), "rows,", n_distinct(raw$id), "participants\n")

# -----------------------------------------------------------------------------
# 2. Compute valid trial counts per participant
# -----------------------------------------------------------------------------
# "Valid" = non-missing choice value. No NAs exist in this dataset, so
# valid_trials = total rows per participant.
trial_counts <- raw |>
  group_by(id) |>
  summarise(
    valid_trials = sum(!is.na(choice)),
    .groups = "drop"
  )

n_below_threshold <- sum(trial_counts$valid_trials < 150)
cat("Participants with < 150 valid trials (to be excluded):", n_below_threshold, "\n")

# -----------------------------------------------------------------------------
# 3. Apply exclusion: keep only participants with exactly 150 valid trials
# -----------------------------------------------------------------------------
include_ids <- trial_counts |>
  filter(valid_trials == 150) |>
  pull(id)

clean <- raw |>
  filter(id %in% include_ids) |>
  # Recode group and gender to labelled factors for clarity in analyses
  mutate(
    group_label  = factor(group,  levels = c(1, 2), labels = c("young", "old")),
    gender_label = factor(gender, levels = c(1, 2), labels = c("male", "female"))
  )

cat("Participants retained after exclusion:", n_distinct(clean$id), "\n")
cat("Total rows in cleaned dataset:", nrow(clean), "\n")

# -----------------------------------------------------------------------------
# 4. Save cleaned dataset
# -----------------------------------------------------------------------------
dir.create(here("data", "processed"), showWarnings = FALSE, recursive = TRUE)

write_csv(clean, here("data", "processed", "ig_data_clean.csv"))

cat("Cleaned data saved to data/processed/ig_data_clean.csv\n")
