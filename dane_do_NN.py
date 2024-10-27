import itertools
import random
def generate_permutations(length):
    values = [0, 1]
    permutations = itertools.product(values, repeat=length)
    return permutations

def recognize_pattern_O(array):
    poprawny_O = [0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0]

    blad0 = False
    blad1 = False
    for i in range(16):
        if poprawny_O[i] != array[i]:
            if array[i] == 1:
                if blad1 == False:
                    blad1 = True
                else:
                    return False
            elif array[i] == 0:
                if blad0 == False:
                    blad0 = True
                else:
                    return False
    return True

def recognize_pattern_X(array):
    poprawny_X = [1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1]

    blad0 = False
    blad1 = False
    for i in range(16):
        if poprawny_X[i] != array[i]:
            if array[i] == 1:
                if blad1 == False:
                    blad1 = True
                else:
                    return False
            elif array[i] == 0:
                if blad0 == False:
                    blad0 = True
                else:
                    return False
    return True


def pattern_detector(vector):
    o_pattern = [0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0]
    o_counter = 0
    x_counter = 0
    for index in range(16):
        if o_pattern[index] == vector[index]:
            o_counter += 1
        else:
            x_counter += 1
    if (o_counter/16) >= 0.875:
        bit_tag = 0
    elif (x_counter/16) >= 0.875:
        bit_tag = 1
    else:
        bit_tag = 2
    return bit_tag





if __name__ == "__main__":

    ##poprawny_O = [0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0]
    ##poprawny_X = [1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1]
    # if recognize_pattern_X([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]):
    #     print("ok")
    # else:
    #     print("nie ok")

    permutations = generate_permutations(16)

    combinations = []

    # Print all permutations
    for permutation in permutations:
        combinations.append(list(permutation))

    wynik = []
    correct = []
    wrong = []




    for el in combinations:
        temp = el[:]
        if recognize_pattern_X(el):
            temp.append(1)
            correct.append(temp)
        elif recognize_pattern_O(el):
            temp.append(0)
            correct.append(temp)
        else:
            temp.append(2)
            wrong.append(temp)

        wynik.append(temp)





    # i = 0
    # for el in wynik:
    #
    #     if el[-1] == 1 or el[-1] == 0:
    #         print(el)
    #         print(i)
    #         i += 1


    test_data = []
    for i in range(int((16384/2))):
        rand_int = random.randint(0,15)
        test_data.append(correct[rand_int])
        test_data.append(wrong[rand_int])


    file = open("data.txt", "w")
    for line in wynik:
        for el in line:
            file.write(str(el) + " ")
        file.write("\n")
    for line in test_data:
        for el in line:
            file.write(str(el) + " ")
        file.write("\n")
    file.close()

    # file = open("data.txt", "w")
    # for line in combinations:
    #     for el in line:
    #         file.write(str(el))
    #     file.write("\n")
    # file.close()
















