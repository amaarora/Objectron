SRC = $(wildcard ./*.ipynb)

all: objectron docs

objectron: $(SRC)
	nbdev_build_lib
	touch objectron

docs: $(SRC)
	nbdev_build_docs
	touch docs

test:
	nbdev_test_nbs

pypi: dist
	twine upload --repository pypi dist/*

dist: clean
	python setup.py sdist bdist_wheel

clean:
	rm -rf dist