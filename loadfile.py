import pandas as pd

def load_movies_data():
    """
    Loads the movies data from 'movies_cleaned.csv'.
    
    Returns:
        pd.DataFrame: The loaded DataFrame containing the movies data.
    """
    file_path = r'C:\Users\zirad\OneDrive\İş masası\lessgo\movies_cleaned.csv'
    return pd.read_csv(file_path)

# Example usage
movies_data = load_movies_data()
print(movies_data.head(2))
