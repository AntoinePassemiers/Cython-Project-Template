# -*- coding: utf-8 -*-
# distutils: language=c
# cython: initializedcheck=False
# cython: nonecheck=False
# cython: overflowcheck=False
# cython: boundscheck=False

from myawesomelib.types cimport data_t

cimport numpy as cnp
cimport libc.math


cdef data_t _sigmoid(data_t x) nogil:
    return 1. / (1. + libc.math.exp(-x))


cdef data_t _logit(data_t x) nogil:
    return libc.math.log(x / (1. - x))
