emus:
	python3 setup.py install

build:
	python3 setup.py build_ext --inplace

install:
	python3 setup.py install

.PHONY: emus build install