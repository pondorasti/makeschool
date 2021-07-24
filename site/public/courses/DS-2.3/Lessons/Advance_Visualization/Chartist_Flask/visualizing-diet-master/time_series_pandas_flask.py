"""
    Visualizing diets over the course of time
"""
from functools import reduce

import pandas as pd
from flask import Flask, render_template, request

app = Flask(__name__)

# Attach our dataframe to our app
app.df = pd.read_csv("multiTimeline.csv", skiprows=1)
app.df.columns = ["month", "diet", "gym", "finance"]


@app.route("/", methods=["GET"])
def get_root():
    """
        Root route that returns the index page
    """
    return render_template("index.html"), 200


@app.route("/time_series", methods=["GET"])
def get_time_series_data():
    """
        Return the necessary data to create a time series
    """
    # Grab the requested years and columns from the query arguments
    ls_year = [int(year) for year in request.args.getlist("n")]
    ls_col = request.args.getlist("m")

    # Generate a list of all the months we need to get
    all_years = [str(year) for year in range(min(ls_year), max(ls_year) + 1)]

    # Grab all of the wanted months by filtering for the ones we want
    wanted_months = reduce(
        lambda a, b: a | b, (app.df["month"].str.contains(year) for year in all_years)
    )

    # Create a new dataframe from the one that
    df_new = app.df[wanted_months][["month"] + ls_col]

    # Convert all string dates into datetime objects and then sort them
    df_new["month"] = pd.to_datetime(df_new["month"])
    df_new = df_new.sort_values(by=["month"])

    # Return the dataframe as json
    return df_new.to_json(), 200


if __name__ == "__main__":
    app.run(host="127.0.0.1", port=3000)
