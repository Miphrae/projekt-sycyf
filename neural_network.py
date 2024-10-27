import tensorflow as tf
import numpy as np

data = np.loadtxt("data.txt")

train_data = []
train_label = []

test_data = []
test_label = []

tr_data = data[:int(0.8*len(data))]
ts_data = data[int(0.8*len(data)):]


for el in tr_data:
    train_data.append(el[0:16])
    train_label.append(el[16])

for el in ts_data:
    test_data.append(el[0:16])
    test_label.append(el[16])

train_data = np.array(train_data, dtype = np.int8)
train_label = np.array(train_label, dtype = np.int8)

test_data = np.array(test_data, dtype = np.int8)
test_label = np.array(test_label, dtype = np.int8)

train_label = tf.keras.utils.to_categorical(train_label)
test_label = tf.keras.utils.to_categorical(test_label)

NN = tf.keras.Sequential()

NN.add(tf.keras.layers.InputLayer(input_shape = (16,)))
NN.add(tf.keras.layers.Dense(6, activation = "relu", name = "firstlayer"))
NN.add(tf.keras.layers.Dense(3, activation = "softmax", name = "secondlayer"))


NN.compile(loss = "categorical_crossentropy", optimizer = "adam", metrics = ["accuracy"])

NN.fit(train_data, train_label, epochs = 500, batch_size = 256)

NN.evaluate(test_data, test_label, verbose = 1)

# for layer in NN.layers:
#     print(layer.name, layer)

# print(NN.layers[0].weights)
# print("------------------------------------------------------------------------------------------")
# print(NN.layers[0].bias.numpy())
# print("------------------------------------------------------------------------------------------")
##print(NN.layers[0].bias_initializer)
print("Weighty i Biasy dla pierwszej warstwy")
print(NN.layers[0].get_weights()[0]) ##weights
print("------------------------------------------------------------------------------------------")
print(NN.layers[0].get_weights()[1]) ## bias
# print(NN.layers[1].weights)
# print(NN.layers[1].bias.numpy())
# print(NN.layers[1].bias_initializer)

print("Weighty i Biasy dla drugiej warstwy")
print(NN.layers[1].get_weights()[0]) ##weights
print("------------------------------------------------------------------------------------------")
print(NN.layers[1].get_weights()[1]) ## bias




