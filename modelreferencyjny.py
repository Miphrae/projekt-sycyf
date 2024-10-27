import random
import numpy as np


def recognize_pattern_O(array):
    poprawny_O = np.array([[0, 1, 1, 0],
                           [1, 0, 0, 1],
                           [1, 0, 0, 1],
                           [0, 1, 1, 0]])

    blad0 = False
    blad1 = False
    for i in range(4):
        for j in range(4):
            if poprawny_O[i][j] != array[i][j]:
                if array[i][j] == 1:
                    if blad1 == False:
                        blad1 = True
                    else:
                        return False
                elif array[i][j] == 0:
                    if blad0 == False:
                        blad0 = True
                    else:
                        return False

    return True


def recognize_pattern_X(array):
    poprawny_X = np.array([[1, 0, 0, 1],
                           [0, 1, 1, 0],
                           [0, 1, 1, 0],
                           [1, 0, 0, 1]])

    blad0 = False
    blad1 = False
    for i in range(4):
        for j in range(4):
            if poprawny_X[i][j] != array[i][j]:
                if array[i][j] == 1:
                    if blad1 == False:
                        blad1 = True
                    else:
                        return False
                elif array[i][j] == 0:
                    if blad0 == False:
                        blad0 = True
                    else:
                        return False

    return True


if __name__ == "__main__":

    for i in range(10000):

        wejscie = np.zeros((4, 4), int)

        while (np.count_nonzero(wejscie == 1) < random.randint(7, 9)):
            wejscie[random.randint(0, 3)][random.randint(0, 3)] = 1

        poprawny_O = np.array([[0, 1, 1, 0],
                               [1, 0, 0, 1],
                               [1, 0, 0, 1],
                               [0, 1, 1, 0]])

        poprawny_X = np.array([[1, 0, 0, 1],
                               [0, 1, 1, 0],
                               [0, 1, 1, 0],
                               [1, 0, 0, 1]])

        if recognize_pattern_O(wejscie):
            print("Wzór o kształcie O został rozpoznany!")
            print("Wzór wygenerowanego wzoru:")
            print(wejscie)
            print(" ")
            print("Porównanie z porównywanym wzorem")
            print(poprawny_O)
            print("------------------------------------------------------------------------------------\n")
        elif recognize_pattern_X(wejscie):
            print("Wzór o kształcie X został rozpoznany!")
            print("Wzór wygenerowanego wzoru:")
            print(wejscie)
            print(" ")
            print("Porównanie z porównywanym wzorem")
            print(poprawny_X)
            print("------------------------------------------------------------------------------------\n")
        else:
            print("Wzór nie został rozpoznany.")
            print("------------------------------------------------------------------------------------\n")