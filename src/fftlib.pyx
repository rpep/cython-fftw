cimport numpy as np
import numpy as np

cdef extern from "fftw3.h":
    ctypedef double fftw_complex[2]

# Because we did the 'complex.h' import 
# we know the data types complex and fftw_complex
# are compatible so this is fine!
cdef extern from "fft_stuff.h":
    struct fft_data:
        complex *data_in;
        complex *data_out;
    void setup(fft_data *data, int N)
    void finalise(fft_data *data)
    void execute_transform_forward(fft_data *data)
    void execute_transform_backward(fft_data *data)


        
cdef class FFTObject(object):
    cdef fft_data data
    cdef public int N
    cdef np.complex128_t[:] data_in_ptr;
    cdef np.complex128_t[:] data_out_ptr;
    cdef public np.ndarray data_in, data_out
    def __cinit__(self, N):
        self.N = N
        setup(&self.data, N)
        self.data_in_ptr = <np.complex128_t[:self.N]> self.data.data_in
        self.data_out_ptr = <np.complex128_t[:self.N]> self.data.data_out
        self.data_in = np.asarray(self.data_in_ptr)
        self.data_out = np.asarray(self.data_out_ptr)

    def __dealloc__(self):
        finalise(&self.data)

    def fft(self):
        execute_transform_forward(&self.data)

    def ifft(self):
        execute_transform_backward(&self.data)

