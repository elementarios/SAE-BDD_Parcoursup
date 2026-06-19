import numpy as np
import pandas as pd
import math


################################################              EXTRACTION             #############################################################
def extractionNum(nomF : str) -> np.ndarray:
    """extrait les données pour pouvoir les utiliser

    Args:
        nomF (String): le nom du fichier CSV depuis lequel en extrait les informations

    Returns:
        np.ndarray: les données numériques sous forme de ndarray exploitable

    """
    lecturePure =  pd.read_csv(nomF,sep=";")
    df_num = lecturePure._get_numeric_data()
    arr = np.array(df_num)
    return arr

def extractionNom(nomF : str) ->np.ndarray:
    """extrait les nom pour pouvoir les utiliser

    Args:
        nomF (str): le nom du fichier CSV depuis lequel en extrait les informations

    Returns:
        np.ndarray: les noms des formations sous forme de ndarray exploitable

    """
    lecture = pd.read_csv(nomF,sep=';')
    nom = lecture.to_numpy()
    return np.array(nom[:,0])





################################################              CREATION MATRICE             #############################################################

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

def matriceX_2(data : np.ndarray,numColonne1 : int,numColonne2 : int) -> np.ndarray:
    """crée une matrice exploitable pour la suite

    Args:
        data (np.ndarray): les données
        numColonne1 (int): le numéro de la premiere colonne souhaité
        numColonne2 (int): le numéro de la deuxieme colonne souhaité

    Returns:
        np.ndarray: la matrice X qui peut etre exploité par la suite
    """
    X=np.zeros([taille(data),3])
    X=X+1
    X[:,1]=data[numColonne1]
    X[:,2]=data[numColonne2]
    return X

def matriceX_3(data : np.ndarray,numColonne1 : int,numColonne2 : int,numColonne3 : int) -> np.ndarray:
    """crée une matrice exploitable pour la suite

    Args:
        data (np.ndarray): les données
        numColonne1 (int): le numéro de la premiere colonne souhaité
        numColonne2 (int): le numéro de la deuxieme colonne souhaité
        numColonne3 (int): le numéro de la troisieme colonne souhaité

    Returns:
        np.ndarray: la matrice X qui peut etre exploité par la suite
    """
    X=np.zeros([taille(data),4])
    X=X+1
    X[:,1]=data[numColonne1]
    X[:,2]=data[numColonne2]
    X[:,3]=data[numColonne3]
    return X

def matriceX_4(data : np.ndarray,numColonne1 : int,numColonne2 : int,numColonne3 : int,numColonne4 : int) -> np.ndarray:
    """crée une matrice exploitable pour la suite

    Args:
        data (np.ndarray): les données
        numColonne1 (int): le numéro de la premiere colonne souhaité
        numColonne2 (int): le numéro de la deuxieme colonne souhaité
        numColonne3 (int): le numéro de la troisieme colonne souhaité
        numColonne4 (int): le numéro de la quatrieme colonne souhaité

    Returns:
        np.ndarray: la matrice X qui peut etre exploité par la suite
    """
    X=np.zeros([taille(data),5])
    X=X+1
    X[:,1]=data[numColonne1]
    X[:,2]=data[numColonne2]
    X[:,3]=data[numColonne3]
    X[:,4]=data[numColonne4]
    return X

def matriceX_5(data : np.ndarray,numColonne1 : int,numColonne2 : int,numColonne3 : int,numColonne4 : int,numColonne5 : int) -> np.ndarray:
    """crée une matrice exploitable pour la suite

    Args:
        data (np.ndarray): les données
        numColonne1 (int): le numéro de la premiere colonne souhaité
        numColonne2 (int): le numéro de la deuxieme colonne souhaité
        numColonne3 (int): le numéro de la troisieme colonne souhaité
        numColonne4 (int): le numéro de la quatrieme colonne souhaité
        numColonne5 (int): le numéro de la cinquième colonne souhaité

    Returns:
        np.ndarray: la matrice X qui peut etre exploité par la suite
    """
    X=np.zeros([taille(data),6])
    X=X+1
    X[:,1]=data[numColonne1]
    X[:,2]=data[numColonne2]
    X[:,3]=data[numColonne3]
    X[:,4]=data[numColonne4]
    X[:,5]=data[numColonne5]
    return X

def matriceX_6(data : np.ndarray,numColonne1 : int,numColonne2 : int,numColonne3 : int,numColonne4 : int,numColonne5 : int,numColonne6 : int) -> np.ndarray:
    """crée une matrice exploitable pour la suite

    Args:
        data (np.ndarray): les données
        numColonne1 (int): le numéro de la premiere colonne souhaité
        numColonne2 (int): le numéro de la deuxieme colonne souhaité
        numColonne3 (int): le numéro de la troisieme colonne souhaité
        numColonne4 (int): le numéro de la quatrieme colonne souhaité
        numColonne5 (int): le numéro de la cinquième colonne souhaité
        numColonne6 (int): le numéro de la sixieme colonne souhaité

    Returns:
        np.ndarray: la matrice X qui peut etre exploité par la suite
    """
    X=np.zeros([taille(data),7])
    X=X+1
    X[:,1]=data[numColonne1]
    X[:,2]=data[numColonne2]
    X[:,3]=data[numColonne3]
    X[:,4]=data[numColonne4]
    X[:,5]=data[numColonne5]
    X[:,6]=data[numColonne6]
    return X






################################################              CALCUL            #############################################################



def taille(data : np.ndarray)-> int :
    """calcule le nombre  de ligne 

    Args:
        data (np.ndarray): les données

    Returns:
        int: le nombres de ligne que contiennent les données
    """
    return data[:,0].size



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
        for j in range(1,tailleA):
            resultat = X[i,j]*A[j]
        resultat+=A[0]
        Predit = np.append(Predit,resultat)
    return Predit

def Erreur(Predit : np.ndarray , Y : np.ndarray)-> np.ndarray:
    """crée une matrice exploitable pour la suite

    Args:
        Prédit (np.ndarray): la matrice des predictions de Y
        Y (np.ndarray): la matrice de la variable endogene

    Returns:
        np.ndarray: l'erreur moyenne
    """
    N = Y.size
    erreur = np.ndarray()
    for i in range(N):
        erreur = np.append(erreur,((Predit[i]-Y[i])**2))
    return erreur


def calculPourcentage(numerateur : np.ndarray,denominateur : np.ndarray) -> np.ndarray:
    """Fait un pourcentage de deux valeur 

    Args:
        numerateur (np.ndarray): la plus petite partie
        denominateur (np.ndarray): la plus grosse partie

    Returns:
        np.ndarray: retourne le pourcentage pour chaque element du nd.array
    """

    return numerateur/denominateur

def moyenne(Y : np.ndarray) -> float:
    """retourne la moyenne d'une matrice 

    Args:
        Y (np.ndarray): la matrice
        

    Returns:
        float : moyenne
    """
    s = 0
    n = Y.size
    for i in range(n):
        s += Y[n]
    return s/n

def variance(Y:np.ndarray) -> float:
    """retourne la variance d'une matrice 

    Args:
        Y (np.ndarray): la matrice
        

    Returns:
        float : la variance
    """
    s=0
    n = Y.size
    m = moyenne(Y)
    for i in range(n):
        s+= (Y[i] - m)**2
    return s

def coefficient(X:np.ndarray , Y: np.ndarray) -> float:
    """Fait le cofficient pour les deux matrice

    Args:
        X (np.ndarray): variables explicatives
        denominateur (np.ndarray): variables endogene

    Returns:
        float : coefficient
    """
    A = calcul_regression_mutliple(X,Y)
    predit = calcul_predit(X,A)
    erreur = Erreur_Moyenne(predit,Y)

    return math.sqrt(1-erreur/variance(Y))