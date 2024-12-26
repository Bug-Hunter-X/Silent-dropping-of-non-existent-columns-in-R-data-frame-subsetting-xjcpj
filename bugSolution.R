```r
# Improved subsetting with error handling

df <- data.frame(A = 1:3, B = 4:6, C = 7:9)
cols_to_subset <- c("A", "D", "C")

# Check if all columns exist before subsetting
if (all(cols_to_subset %in% names(df))) {
  subset_df <- df[, cols_to_subset]
} else {
  missing_cols <- cols_to_subset[!cols_to_subset %in% names(df)]
  stop(paste("Error: Columns", paste(missing_cols, collapse = ", "), "not found in data frame."))
}

#Alternative approach using dplyr
library(dplyr)
subset_df <- df %>% select(all_of(cols_to_subset))
#This will throw an error if columns are not found.
```