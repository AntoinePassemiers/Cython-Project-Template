# distutils: language=c
# cython: initializedcheck=False
# cython: nonecheck=False
# cython: overflowcheck=False
# cython: boundscheck=False

cimport numpy as cnp


ctypedef cnp.float_t data_t


ctypedef data_t (*ufunc)(data_t) nogil
