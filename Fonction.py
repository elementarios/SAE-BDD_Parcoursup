import numpy as np
import pandas as pd


def extraction(nomF : str) -> np.ndarray:
    """extrait les données pour pouvoir les utiliser

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
    """calcule le nombre  de ligne 

    Args:
        data (np.ndarray): les données

    Returns:
        int: le nombres de ligne que contiennent les données
    """
    return data[:,0].size


def matriceX_1(data : np.ndarray,numColonne : int) -> np.ndarray:
    """crée une matrice exploitable pour la suite

    Args:
        data (np.ndarray): les données
        numColonne (int): le numéro de la colonne souhaité

    Returns:
        np.ndarray: la matrice X qui peut etre exploité par la suite
    """
    X=np.zeros([taille(data),2])
    X=X+1
    X[:,1]=data[numColonne]
    return X