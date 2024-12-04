# Load required library
install.packages("corrplot")
library(corrplot)
library(httpgd)
hgd()

# Load the dataset
movies_data <- read.csv("movies_cleaned.csv")

# Select numerical columns excluding 'year'
numerical_columns <- c("score", "votes", "budget", "gross", "runtime")

# Subset the dataset to only the selected numerical columns
numerical_data <- movies_data[, numerical_columns]

# Calculate the correlation matrix
correlation_matrix <- cor(numerical_data, use = "complete.obs")

# Plot the correlation matrix
# corrplot(correlation_matrix, method = "color", type = "full", 
#          tl.col = "black", tl.srt = 45, 
#          title = "Correlation Heatmap", mar = c(0, 0, 2, 0))

# --------------------------------------------------------------------------
# Define a function to plot correlation heatmaps with values
plot_correlation <- function(type, title) {
  corrplot(correlation_matrix, method = "color", type = type, 
           tl.col = "black", tl.srt = 45, 
           addCoef.col = "white", # Add correlation values in black
           number.cex = 0.8,      # Adjust size of correlation values
           title = title, mar = c(0, 0, 2, 0))
}

# Loop through the three types
types <- c("upper", "lower", "full")
titles <- c("Upper Correlation Heatmap", "Lower Correlation Heatmap", "Full Correlation Heatmap")

# Generate all three plots
for (i in seq_along(types)) {
  plot_correlation(types[i], titles[i])
}

# # Define a function to plot and save correlation heatmaps with values
# plot_correlation <- function(type, title, file_name) {
#   # Save the plot as a PNG file
#   png(filename = file_name, width = 800, height = 600)  # Adjust width and height as needed
#   corrplot(correlation_matrix, method = "color", type = type, 
#            tl.col = "black", tl.srt = 45, 
#            addCoef.col = "white", # Add correlation values
#            number.cex = 0.8,      # Adjust size of correlation values
#            title = title, mar = c(0, 0, 2, 0))
#   dev.off()  # Close the device
# }

# # Loop through the three types
# types <- c("upper", "lower", "full")
# titles <- c("Upper Correlation Heatmap", "Lower Correlation Heatmap", "Full Correlation Heatmap")
# file_names <- c("upper_heatmap.png", "lower_heatmap.png", "full_heatmap.png")  # File names

# # Generate and save all three plots
# for (i in seq_along(types)) {
#   plot_correlation(types[i], titles[i], file_names[i])
# }
