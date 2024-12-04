import pandas as pd
import logging

movies_data = file_path = r'C:\Users\zirad\OneDrive\İş masası\lessgo\movies_cleaned.csv'

# Setup logging to capture preprocessing steps
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

def preprocess_movies_data(movies_data):
    # 1. Rename `runtime,,` to `runtime`
    if 'runtime,,' in movies_data.columns:
        movies_data.rename(columns={'runtime,,': 'runtime'}, inplace=True)
        logging.info("Renamed column 'runtime,,' to 'runtime'.")

    # 2. Remove trailing commas and whitespace in the `runtime` column (if string type)
    if movies_data['runtime'].dtype == 'object':
        movies_data['runtime'] = movies_data['runtime'].str.strip().str.replace(',', '', regex=False)
        logging.info("Cleaned trailing commas and whitespace in 'runtime' column.")

    # 3. Convert 'runtime' to numeric
    movies_data['runtime'] = pd.to_numeric(movies_data['runtime'], errors='coerce')
    logging.info("Converted 'runtime' column to numeric.")

    # 4. Drop rows with NaN values in crucial columns
    crucial_columns = ['name', 'score', 'votes', 'budget', 'gross', 'runtime']
    rows_before = len(movies_data)
    movies_data_cleaned = movies_data.dropna(subset=crucial_columns).copy()
    rows_after = len(movies_data_cleaned)
    logging.info(f"Dropped {rows_before - rows_after} rows with NaN in crucial columns.")

    # 5. Convert 'budget' and 'gross' columns to numeric
    movies_data_cleaned['budget'] = pd.to_numeric(movies_data_cleaned['budget'], errors='coerce')
    movies_data_cleaned['gross'] = pd.to_numeric(movies_data_cleaned['gross'], errors='coerce')
    logging.info("Converted 'budget' and 'gross' columns to numeric.")

    # 6. Standardize 'released' column
    if 'released' in movies_data_cleaned.columns:
        movies_data_cleaned['released'] = movies_data_cleaned['released'].str.extract(r'(\w+ \d{1,2}, \d{4})')
        movies_data_cleaned['released_date'] = pd.to_datetime(
            movies_data_cleaned['released'], format='%B %d, %Y', errors='coerce'
        )
        logging.info("Standardized 'released' column to datetime format.")

    # 7. Trim and clean string columns
    string_columns = ['name', 'genre', 'director', 'writer', 'star', 'company', 'country']
    for col in string_columns:
        if col in movies_data_cleaned.columns:
            movies_data_cleaned[col] = movies_data_cleaned[col].str.strip()
    logging.info("Trimmed and cleaned string columns.")

    # 8. Remove duplicates
    rows_before = len(movies_data_cleaned)
    movies_data_cleaned = movies_data_cleaned.drop_duplicates()
    rows_after = len(movies_data_cleaned)
    logging.info(f"Removed {rows_before - rows_after} duplicate rows.")

    return movies_data_cleaned

# Example usage:
file_path = 'movies_updated.csv'
movies_data = pd.read_csv(file_path)
movies_data_cleaned = preprocess_movies_data(movies_data)

# Optionally, save the cleaned dataset
movies_data_cleaned.to_csv('movies_cleaned.csv', index=False)
logging.info("Saved cleaned dataset to 'movies_cleaned.csv'.")
