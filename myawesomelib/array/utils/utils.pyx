# -*- coding: utf-8 -*-
# distutils: language=c
# cython: initializedcheck=False
# cython: nonecheck=False
# cython: overflowcheck=False
# cython: boundscheck=False

from myawesomelib.types cimport data_t, ufunc

import numpy as np
cimport numpy as cnp
cnp.import_array()


cdef apply_ufunc(cnp.ndarray x, ufunc f, bint inplace=False):
    # Generic wrapper that applies a scalar function to
    # an arbitrarily-shaped NumPy array
    x = np.asarray(x, dtype=np.float)
    if not inplace:
        x = np.copy(x)
    cdef int ndim = len(np.asarray(x).shape)
    if ndim == 0:
        return apply_ufunc0(x, f)
    elif ndim == 1:
        return apply_ufunc1(x, f)
    elif ndim == 2:
        return apply_ufunc2(x, f)
    elif ndim == 3:
        return apply_ufunc3(x, f)
    elif ndim == 4:
        return apply_ufunc4(x, f)
    elif ndim == 5:
        return apply_ufunc5(x, f)
    elif ndim == 6:
        return apply_ufunc6(x, f)
    elif ndim == 7:
        return apply_ufunc7(x, f)


cdef data_t apply_ufunc0(data_t x, ufunc f) nogil:
    return f(x)


cdef data_t[:] apply_ufunc1(data_t[:] x, ufunc f) nogil:
    cdef int i
    for i in range(x.shape[0]):
        x[i] = f(x[i])
    return x


cdef data_t[:, :] apply_ufunc2(data_t[:, :] x, ufunc f) nogil:
    cdef int i, j
    for i in range(x.shape[0]):
        for j in range(x.shape[1]):
            x[i, j] = f(x[i, j])
    return x


cdef data_t[:, :, :] apply_ufunc3(data_t[:, :, :] x, ufunc f) nogil:
    cdef int i, j, k
    for i in range(x.shape[0]):
        for j in range(x.shape[1]):
            for k in range(x.shape[2]):
                x[i, j, k] = f(x[i, j, k])
    return x


cdef data_t[:, :, :, :] apply_ufunc4(data_t[:, :, :, :] x, ufunc f) nogil:
    cdef int i, j, k, l
    for i in range(x.shape[0]):
        for j in range(x.shape[1]):
            for k in range(x.shape[2]):
                for l in range(x.shape[3]):
                    x[i, j, k, l] = f(x[i, j, k, l])
    return x


cdef data_t[:, :, :, :, :] apply_ufunc5(data_t[:, :, :, :, :] x, ufunc f) nogil:
    cdef int i, j, k, l, m
    for i in range(x.shape[0]):
        for j in range(x.shape[1]):
            for k in range(x.shape[2]):
                for l in range(x.shape[3]):
                    for m in range(x.shape[4]):
                        x[i, j, k, l, m] = f(x[i, j, k, l, m])
    return x


cdef data_t[:, :, :, :, :, :] apply_ufunc6(data_t[:, :, :, :, :, :] x, ufunc f) nogil:
    cdef int i, j, k, l, m, n
    for i in range(x.shape[0]):
        for j in range(x.shape[1]):
            for k in range(x.shape[2]):
                for l in range(x.shape[3]):
                    for m in range(x.shape[4]):
                        for n in range(x.shape[5]):
                            x[i, j, k, l, m, n] = f(x[i, j, k, l, m, n])
    return x


cdef data_t[:, :, :, :, :, :, :] apply_ufunc7(data_t[:, :, :, :, :, :, :] x, ufunc f) nogil:
    cdef int i, j, k, l, m, n, o
    for i in range(x.shape[0]):
        for j in range(x.shape[1]):
            for k in range(x.shape[2]):
                for l in range(x.shape[3]):
                    for m in range(x.shape[4]):
                        for n in range(x.shape[5]):
                            for o in range(x.shape[6]):
                                x[i, j, k, l, m, n, o] = f(x[i, j, k, l, m, n, o])
    return x
