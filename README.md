# Cython-FFTW

This repository just shows how simple it is to wrap up C functions with Cython so that they can be used in Python.

All of the interesting code here is written in C. The point of this is not to show how we can do complex wrapping with
Cython; it's to show that if you already have everything set up in C functions, the Cython code can be very straightforward and not have complex type definitions. This is my preferred method of using Cython, as it gives the best performance.

To run this:

> make fftw
> make

To test:

> py.test -v

