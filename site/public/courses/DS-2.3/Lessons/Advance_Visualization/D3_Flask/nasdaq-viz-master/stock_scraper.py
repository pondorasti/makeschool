"""
    stock scraping app
"""
import pandas as pd
import requests


def retrieve_stocks():
    """
        Retrieve the stocks from the nasdaq

        Returns a dataframe
    """
    # Get the csv file
    request = requests.get(
        "http://www.nasdaq.com/quotes/nasdaq-100-stocks.aspx?render=download"
    )
    # convert the csv file into a list of lines
    processed_text = request.text.split("\n")

    dataframe_rows = []

    # convert each line into an element inside of the list
    # skip the first line, as it contains the columns.
    for line in processed_text[1:]:
        row = line.split(",")[:-1]
        dataframe_rows.append(row)

    # Use all rows besides the last one (Garbage)
    dataframe = pd.DataFrame(dataframe_rows[:-1])

    # set columns using the first element in the processed csv
    # besides the last index in the list (Garbage)
    columns = processed_text[:1][0].rstrip().split(",")[:-1]

    # Format the columns to have no spaces and to all be lowercas
    fmted_cols = []
    for col in columns:
        fmted_cols.append(col.strip().lower())

    # Assign the columns of the dataframe to be the formatted columns
    dataframe.columns = fmted_cols
    return dataframe
