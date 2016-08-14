.PHONY: all init test docs install clean

all: test

init:
	pip install -r requirements.txt

test:
	nosetests tests

docs:
	mkdir -p build dist
	grep version setup.py | sed "s/^[^']*'//" | sed "s/',//" > build/version.txt
	sphinx-build -b html docs build
	cd build; zip -r ../dist/arlpy-docs.zip *

install:
	python setup.py install

clean:
	find . -name *.pyc -exec rm {} \;
	rm -rf build arlpy.egg-info dist
