from sklearn import datasets
import scipy  
import numpy
import sys

if len(sys.argv) > 0:
 print sys.argv[1]

digits = datasets.load_digits()
print(digits.data)
