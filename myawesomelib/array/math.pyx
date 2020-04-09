# -*- coding: utf-8 -*-
# distutils: language=c
# cython: initializedcheck=False
# cython: nonecheck=False
# cython: overflowcheck=False
# cython: boundscheck=False

from myawesomelib.array.utils.utils cimport *
from myawesomelib.types cimport ufunc
from myawesomelib.ufuncs.math cimport *

import numpy as np
cimport numpy as cnp
cnp.import_array()

cimport libc.math


def sigmoid(x):
    return np.asarray(apply_ufunc(x, <ufunc>_sigmoid))


def logit(x):
    return np.asarray(apply_ufunc(x, <ufunc>_logit))
