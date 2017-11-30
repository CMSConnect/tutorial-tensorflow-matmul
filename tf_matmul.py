# simple example to show the matrix multiplication with tensorflow

import tensorflow as tf
sess = tf.Session(config=tf.ConfigProto(log_device_placement=True))
matrix1 = tf.constant([1.0,2.0,3.0,4.0], shape=[2, 2])
matrix2 = tf.matrix_inverse(matrix1)
product = tf.matmul(matrix1, matrix2)
# with tf.Session() as sess:
with tf.Session(config=tf.ConfigProto(log_device_placement=True)) as sess:
    result = sess.run(product)
    print("result of matrix multiplication")
    print("===============================")
    print(result)
    print("===============================")
