"""
    Utility file for handling extraneous features
"""

import pandas as pd


def load_dataframe(filepath):
    """
        Load a dataframe from a given file path
    """
    return pd.read_pickle(filepath)


def save_dataframe(dataframe, filepath):
    """
        save a dataframe to a given file path
    """
    dataframe.to_pickle(filepath)
