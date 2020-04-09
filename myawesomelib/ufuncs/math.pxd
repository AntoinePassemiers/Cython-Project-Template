# -*- coding: utf-8 -*-
# distutils: language=c
# cython: initializedcheck=False
# cython: nonecheck=False
# cython: overflowcheck=False
# cython: boundscheck=False

from myawesomelib.types cimport data_t

cimport numpy as cnp
cimport libc.math


cdef data_t _sigmoid(data_t x) nogil


cdef data_t _logit(data_t x) nogil
