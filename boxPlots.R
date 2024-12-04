# Load required libraries
library(ggplot2)
library(httpgd)

# Start httpgd for interactive plotting
hgd()

# Load your dataset
load_movies_data <- function() {
  file_path <- "C:/Users/zirad/OneDrive/İş masası/lessgo/movies_cleaned.csv"
  movies_data <- read.csv(file_path)
  return(movies_data)
}

movies_data <- load_movies_data()

# 1. Boxplots for Score
# a. By Genre
plot_score_genre <- ggplot(movies_data, aes(x = genre, y = score, fill = genre)) +
  geom_boxplot(outlier.color = "black", outlier.shape = 16) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Score by Genre", x = "Genre", y = "Score", fill = "Genre")
print(plot_score_genre)

# b. By Rating
plot_score_rating <- ggplot(movies_data, aes(x = rating, y = score, fill = rating)) +
  geom_boxplot(outlier.color = "black", outlier.shape = 16) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Score by Rating", x = "Rating", y = "Score", fill = "Rating")
print(plot_score_rating)

# c. By Year
plot_score_year <- ggplot(movies_data, aes(x = factor(year), y = score, fill = factor(year))) +
  geom_boxplot(outlier.color = "black", outlier.shape = 16) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Score by Year", x = "Year", y = "Score", fill = "Year")
print(plot_score_year)

# 2. Boxplots for Votes
# a. By Rating
plot_votes_rating <- ggplot(movies_data, aes(x = rating, y = votes, fill = rating)) +
  geom_boxplot(outlier.color = "black", outlier.shape = 16) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Votes by Rating", x = "Rating", y = "Votes", fill = "Rating")
print(plot_votes_rating)

# b. By Genre
plot_votes_genre <- ggplot(movies_data, aes(x = genre, y = votes, fill = genre)) + # nolint
  geom_boxplot(outlier.color = "black", outlier.shape = 16) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Votes by Genre", x = "Genre", y = "Votes", fill = "Genre")
print(plot_votes_genre)

# c. By Country
plot_votes_country <- ggplot(movies_data, aes(x = country, y = votes, fill = country)) + # nolint
  geom_boxplot(outlier.color = "black", outlier.shape = 16) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Votes by Country", x = "Country", y = "Votes", fill = "Country")
print(plot_votes_country)

# 3. Boxplots for Budget
# a. By Genre
plot_budget_genre <- ggplot(movies_data, aes(x = genre, y = budget, fill = genre)) + # nolint
  geom_boxplot(outlier.color = "black", outlier.shape = 16) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Budget by Genre", x = "Genre", y = "Budget", fill = "Genre")
print(plot_budget_genre)

# b. By Rating
plot_budget_rating <- ggplot(movies_data, aes(x = rating, y = budget, fill = rating)) + # nolint
  geom_boxplot(outlier.color = "black", outlier.shape = 16) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Budget by Rating", x = "Rating", y = "Budget", fill = "Rating")
print(plot_budget_rating)

# c. By Year
plot_budget_year <- ggplot(movies_data, aes(x = factor(year), y = budget, fill = factor(year))) + # nolint
  geom_boxplot(outlier.color = "black", outlier.shape = 16) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Budget by Year", x = "Year", y = "Budget", fill = "Year")
print(plot_budget_year)

# 4. Boxplots for Gross
# a. By Year
plot_gross_year <- ggplot(movies_data, aes(x = factor(year), y = gross, fill = factor(year))) + # nolint
  geom_boxplot(outlier.color = "black", outlier.shape = 16) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Gross by Year", x = "Year", y = "Gross", fill = "Year")
print(plot_gross_year)

# b. By Genre
plot_gross_genre <- ggplot(movies_data, aes(x = genre, y = gross, fill = genre)) + # nolint
  geom_boxplot(outlier.color = "black", outlier.shape = 16) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Gross by Genre", x = "Genre", y = "Gross", fill = "Genre")
print(plot_gross_genre)

# c. By Rating
plot_gross_rating <- ggplot(movies_data, aes(x = rating, y = gross, fill = rating)) + # nolint
  geom_boxplot(outlier.color = "black", outlier.shape = 16) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Gross by Rating", x = "Rating", y = "Gross", fill = "Rating")
print(plot_gross_rating)

# 5. Boxplots for Runtime
# a. By Genre
plot_runtime_genre <- ggplot(movies_data, aes(x = genre, y = runtime, fill = genre)) + # nolint
  geom_boxplot(outlier.color = "black", outlier.shape = 16) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Runtime by Genre", x = "Genre", y = "Runtime", fill = "Genre")
print(plot_runtime_genre)

# b. By Country
plot_runtime_country <- ggplot(movies_data, aes(x = country, y = runtime, fill = country)) + # nolint
  geom_boxplot(outlier.color = "black", outlier.shape = 16) + 
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Runtime by Country", x = "Country", y = "Runtime", fill = "Country") # nolint
print(plot_runtime_country)

# c. By Year
plot_runtime_year <- ggplot(movies_data, aes(x = factor(year), y = runtime, fill = factor(year))) + # nolint
  geom_boxplot(outlier.color = "black", outlier.shape = 16) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Runtime by Year", x = "Year", y = "Runtime", fill = "Year")
print(plot_runtime_year)
# dev.off()