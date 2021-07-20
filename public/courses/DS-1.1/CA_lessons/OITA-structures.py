# !python3

################################################################################
####################### IMPORTATIONS AND INITIALIZATIONS #######################
################################################################################


# Data Analysis/Visualization Toolkit.
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Scientific Analysis Operations Toolkit
from scipy import stats


################################################################################
########################### FUNCTIONAL ARCHITECTURES ###########################
################################################################################


def aggregate_composite_dataset(dataset, region_feature="HUCName", target_feature="COND", include_regionals=False):
    """ 
    Custom function to create and aggregate region-dependent tables for composition-evaluated dataset. 
    
    Used for Visualization Inquiries #3-5.
    """
    # Get total regions across dataset across which to evaluate
    regions = dataset[region_feature].unique().tolist()
    # Set variables to contain regional and composite datasets
    regional_datasets, composite_dataset = dict(), None
    # Iteratively isolate datasets by region, year, and target composition
    for region in regions:
        ARG_REGIONAL_SLICE = dataset[region_feature] == region
        regional_datasets[region] = dataset[ARG_REGIONAL_SLICE].groupby("YEAR")[target_feature].mean().reset_index()
        regional_datasets[region].rename(columns={target_feature: "MEAN_{}".format(target_feature.upper())}, 
                                         inplace=True)
        regional_datasets[region]["REGION"] = region        
        # Create and append regional datasets to composite super-dataset
        if composite_dataset is None:
            composite_dataset = regional_datasets[region]
        else:
            composite_dataset = composite_dataset.append(regional_datasets[region], ignore_index=True)
    # Return composite (and conditionally regional) dataset(s)
    if include_regionals is True:
        return (composite_dataset, regional_datasets)
    else:
        return composite_dataset


################################################################################
############################# OBJECT ARCHITECTURES #############################
################################################################################


class Visualizer(object):
    """ 
    Custom visualization object designated for O.I.T.A. project usage. 
    
    TODO: Reimplement the `classless_q1()` algorithm as a method of `Visualizer()`.
    
    Additionally, follow the added reimplementation quality-of-life improvement requirements
    as provided by the notebook challenge section.
    """
    def __init__(self):
        """ Initialization method. """
        return
    
    def Q1(self, stacked=False):
        """ 
        Plotting method to obtain visual answer to Inquiry #1. 
        
        - TODO: Core Task: Reimplement the `classless_q1()` algorithm as a method of `Visualizer()`.
        - TODO: Addendum A: Modify function parameters to allow for plotting title keyword argument.
        - TODO: Addendum B: Modify function parameters to allow for dataset bivariate keyword arguments.
        - TODO: Addendum C: Modify function operations to allow for bar quantity keyword arguments.
        - TODO: Addendum D: Modify function operations to allow for visualization image saving.
        """
        return
    
    def Q2(self):
        """ Plotting method to obtain visual answer to Inquiry #2. """
        # TODO: Reimplement the `classless_q2()` algorithm as a method of `Visualizer()`.
        return