# -*- coding: utf-8 -*-
# distutils: language=c
# cython: initializedcheck=False
# cython: nonecheck=False
# cython: overflowcheck=False
# cython: boundscheck=False

from myawesomelib.types cimport data_t, ufunc

cimport numpy as cnp


cdef apply_ufunc(cnp.ndarray x, ufunc f, bint inplace=?)


cdef data_t apply_ufunc0(data_t x, ufunc f) nogil


cdef data_t[:] apply_ufunc1(data_t[:] x, ufunc f) nogil


cdef data_t[:, :] apply_ufunc2(data_t[:, :] x, ufunc f) nogil


cdef data_t[:, :, :] apply_ufunc3(data_t[:, :, :] x, ufunc f) nogil


cdef data_t[:, :, :, :] apply_ufunc4(data_t[:, :, :, :] x, ufunc f) nogil


cdef data_t[:, :, :, :, :] apply_ufunc5(data_t[:, :, :, :, :] x, ufunc f) nogil


cdef data_t[:, :, :, :, :, :] apply_ufunc6(data_t[:, :, :, :, :, :] x, ufunc f) nogil


cdef data_t[:, :, :, :, :, :, :] apply_ufunc7(data_t[:, :, :, :, :, :, :] x, ufunc f) nogil
