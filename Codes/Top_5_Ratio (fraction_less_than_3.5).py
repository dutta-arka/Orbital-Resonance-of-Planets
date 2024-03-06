# -*- coding: utf-8 -*-
"""
Created on Wed Mar  6 22:18:02 2024

@author: Arkaprova Dutta
"""

import pandas as pd

# Function to convert a ratio to a fraction and check if both numerator and denominator are less than 3.5
def check_ratio_validity(ratio):
    num, denom = map(float, ratio.split(':'))
    fraction = num / denom
    return num < 3.5 and denom < 3.5

# Flatten the list of ratios and filter out ratios with values less than 3.5
valid_ratios = [ratio for sublist in rdf['Ratios'] for ratio in sublist if check_ratio_validity(ratio)]

# Count occurrences of each valid ratio
ratio_counts = pd.Series(valid_ratios).value_counts()

# Calculate percentage of each ratio
ratio_percentages = (ratio_counts / ratio_counts.sum()) * 100

# Sort ratios based on occurrences in descending order
sorted_ratios = ratio_counts.index.tolist()

# Select top 5 ratios and their percentages
top_5_ratios = sorted_ratios[:10]
top_5_percentages = ratio_percentages[top_5_ratios]

# Create a DataFrame for top 5 ratios and percentages
top_5_df = pd.DataFrame({'Ratio': top_5_ratios, 'Percentage': top_5_percentages})
top_5_df.reset_index(drop=True, inplace=True)

print("Top 5 most likely ratios and their percentages:")
print(top_5_df)