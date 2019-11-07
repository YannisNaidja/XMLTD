from pylab import *
import matplotlib.pyplot as plt

def append_point(list_x, list_y, x, y):
    list_x.append(x)
    list_y.append(y)

list_x = list()
list_y = list()

append_point(list_x, list_y, 1, 50)
append_point(list_x, list_y, 2, 19)
append_point(list_x, list_y, 3, 6)
append_point(list_x, list_y, 4, 5)
append_point(list_x, list_y, 7, 12)
append_point(list_x, list_y, 8, 11)
append_point(list_x, list_y, 9, 10)
append_point(list_x, list_y, 13, 18)
append_point(list_x, list_y, 14, 17)
append_point(list_x, list_y, 15, 16)
append_point(list_x, list_y, 20, 49)
append_point(list_x, list_y, 21, 24)
append_point(list_x, list_y, 22, 23)
append_point(list_x, list_y, 25, 34)
append_point(list_x, list_y, 26, 29)
append_point(list_x, list_y, 27, 28)
append_point(list_x, list_y, 30, 33)
append_point(list_x, list_y, 31, 32)
append_point(list_x, list_y, 35, 48)
append_point(list_x, list_y, 36, 39)
append_point(list_x, list_y, 37, 38)
append_point(list_x, list_y, 40, 43)
append_point(list_x, list_y, 41, 42)
append_point(list_x, list_y, 44, 47)
append_point(list_x, list_y, 45, 46)

scatter(list_x, list_y, s=50 ,marker='o')

grid()

show()
