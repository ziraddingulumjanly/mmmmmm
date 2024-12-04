import seaborn as sns
import matplotlib.pyplot as plt
from loadfile import load_movies_data

# Load the dataset
df = load_movies_data()

# Display the first few rows of the dataset
print(df.head())

# Specify the columns you want to analyze
columns_of_interest = ['score', 'votes', 'budget', 'gross', 'runtime']  # Replace with your column names

# Subset the DataFrame for the specified columns
subset_df = df[columns_of_interest]

# Compute the correlation matrix for the subset
correlation_matrix = subset_df.corr()

# Print the correlation matrix
print("Correlation Matrix:")
print(correlation_matrix)

# Plot the heatmap
plt.figure(figsize=(10, 8))  # Adjust the figure size as needed
sns.heatmap(correlation_matrix, annot=True, fmt=".2f", cmap='coolwarm', cbar=True)
plt.title("Correlation Heatmap for Selected Columns")
plt.show()
