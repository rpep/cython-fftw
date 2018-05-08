FFTW_VERSION=3.3.7
FFTW_FOLDER=fftw-$(FFTW_VERSION)

all: fftw
	python setup.py build_ext --inplace

fftw:
	wget http://fftw.org/fftw-$(FFTW_VERSION).tar.gz
	tar -xvf fftw-$(FFTW_VERSION).tar.gz
	rm fftw-$(FFTW_VERSION).tar.gz
	cd $(FFTW_FOLDER) \
        && cmake . -DCMAKE_INSTALL_PREFIX=$(PWD) \
           -DENABLE_AVX2=YES -DENABLE_AVX=YES -DENABLE_SSE2=YES -DENABLE_SSE=YES \
        && make install
	#rm -rf fftw-$(FFTW_VERSION)
clean:
	rm -rf lib
	rm -rf src/fftlib.c
	rm -rf *.so
	rm -rf build
	rm -rf include/fftw3.h
	rm -rf include/fftw3.f
	rm -rf __pycache__
	rm -rf .pytest_cache
	rm -rf .hypothesis
test:
	pytest test_fft.py