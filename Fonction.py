import numpy as np
import pandas as pd


def extraction(nomF : str) -> np.ndarray:
    """_summary_

    Args:
        nomF (String): le nom du fichier CSV depuis lequel en extrait les informations

    Returns:
        np.ndarray: les données numériques sous forme de ndarray exploitable
    """
    lecturePure =  pd.read_csv("ParcoursupLannion-Reduit.csv")
    df_num = lecturePure._get_numeric_data()
    arr_lannion = np.array(df_num)
    return arr_lannion


def taille(data : np.ndarray)-> int :
    """_summary_

    Args:
        data (np.ndarray): les données

    Returns:
        int: le nombres de ligne que contiennent les données
    """
    return data[:,0].size
