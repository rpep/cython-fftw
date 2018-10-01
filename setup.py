from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext
from Cython.Build import cythonize
import numpy
# If you have the Intel MKL installed,
# you can use the Intel Link Line advisor
# and replace the fftw3 library with MKL
# once you have compiled the FFTW3 interface
# called fftw3xc

libs = ['m', 'fftw3']
args = ['-std=c99', '-O3']
sources = ['src/fftlib.pyx', 'src/fft_stuff.c']
include = ['include',numpy.get_include()]
linkerargs = ['-Wl,-rpath,lib']
libdirs = ['lib']


extensions = [
    Extension("fftlib",
              sources=sources,
              include_dirs=include,
              libraries=libs,
              library_dirs=libdirs,
              extra_compile_args=args,
              extra_link_args=linkerargs)
]

setup(name='fftlib',
      packages=['fftlib'],
      ext_modules=cythonize(extensions),
      )
