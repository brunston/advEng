# -*- coding: utf-8 -*-
"""
Python for Data Analysis
20150427
brupoon
"""
import numpy as np
arr = np.empty((8,4))
for i in range(8):
    arr[i] = i
arrSelection = arr[[4, 3, 0, 6]]

arr2 = np.arange(32).reshape((8,4))
arr2Selection = arr[[1, 5, 7, 2], [0, 3, 1, 2]]