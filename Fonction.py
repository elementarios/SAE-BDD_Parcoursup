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


def matriceY(data : np.ndarray , numColonne : int)-> np.ndarray:
    """crée une matrice exploitable pour la suite

    Args:
        data (np.ndarray): les données
        numColonne (int): le numéro de la colonne souhaité

    Returns:
        np.ndarray: la matrice Y qui peut etre exploité par la suite
    """
    Y = np.zeros([taille(data),1])
    Y[:,0] = data[numColonne]
    return Y


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


def calcul_regression_mutliple(X : np.ndarray,Y : np.ndarray) -> np.ndarray:
    """crée une matrice exploitable pour la suite

    Args:
        X (np.ndarray): la matrice des variables externes
        Y (np.ndarray): la matrice de la variable endogene

    Returns:
        np.ndarray: la matrice de regression multiple qui peut etre exploité par la suite
    """
    tX = np.transpose(X)
    XtX = tX @ X
    A = np.linalg.inv(XtX) @ (tX @ Y)
    return A

def calcul_predit(X : np.ndarray,A : np.ndarray) -> np.ndarray:
    """crée une matrice exploitable pour la suite

    Args:
        X (np.ndarray): la matrice des variables externes
        A (np.ndarray): la matrice de regression multiple

    Returns:
        np.ndarray: la matrice des predictions de Y
    """
    tailleX = taille(X)
    Predit = np.ndarray()
    tailleA = A.size
    for i in range(tailleX):
        resultat = 0
        for j in range(tailleA-1):
            resultat = X[i,j+1]*A[j]
        resultat+=A[tailleA-1]
        Predit = np.append(Predit,resultat)
    return Predit

def Erreur_Moyenne(Predit : np.ndarray , Y : np.ndarray)-> float:
    """crée une matrice exploitable pour la suite

    Args:
        Prédit (np.ndarray): la matrice des predictions de Y
        Y (np.ndarray): la matrice de la variable endogene

    Returns:
        float: l'erreur moyenne
    """
    S = 0.0
    N = Y.size
    for i in range(N):
        S+= (Predit[i]-Y[i])**2
    return S/N
        


