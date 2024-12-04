# Load required libraries
install.packages("ggplot2")
install.packages("plotly")
library(ggplot2)
library(dplyr)
library(httpgd)

# Activate the httpgd interactive device
hgd()

# Load the dataset
movies_data <- read.csv("movies_cleaned.csv")

# Ensure necessary columns are present
if (!("year" %in% colnames(movies_data)) | !("genre" %in% colnames(movies_data))) {
  stop("Dataset must contain 'year' and 'genre' columns.")
}

# Aggregate data: Count the number of movies by year and genre
movies_by_year_genre <- movies_data %>%
  group_by(year, genre) %>%
  summarize(movie_count = n(), .groups = "drop")

# --- Plot 1: All genres with faceting (Barplots) ---
all_genres_barplot <- ggplot(movies_by_year_genre, aes(x = year, y = movie_count, fill = genre)) +
  geom_bar(stat = "identity") +  # Use barplot with counts
  facet_wrap(~ genre, scales = "free_y") +  # Facet by genre
  labs(title = "Number of Movies Released by Year and Genre (Barplots for All Genres)",
       x = "Year",
       y = "Number of Movies") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Display the plot interactively
print(all_genres_barplot)

