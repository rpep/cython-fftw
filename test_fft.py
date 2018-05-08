from fftlib import FFTObject
import numpy as np
import matplotlib.pyplot as plt

n = 100
x = np.linspace(0, 100, n, dtype=np.complex)
y = np.sin(x/10.0)
reference = np.fft.fft(y)

a = FFTObject(n)
a.data_in[:] = y
a.fft()
print('reference')
print(reference[:15])
print('FFTW')
print(a.data_out[:15])

