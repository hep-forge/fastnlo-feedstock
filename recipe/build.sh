#! /usr/bin/bash

cd ./v*/toolkit
export PYTHONPATH=$SP_DIR

echo 'AUTOMAKE_OPTIONS = no-dependencies' >> Makefile.am
autoreconf -vfi

./configure --enable-pyext --enable-fortranext \
            --prefix=$PREFIX --with-zlib=$PREFIX --with-root=$PREFIX --with-lhapdf=$PREFIX \
            --with-yoda=$PREFIX --with-qcdnum=$PREFIX --with-fastjet=$PREFIX --with-hoppet=$PREFIX \
            --disable-dependency-tracking

make -j$(nproc)
lhapdf install CT10nlo

make check
make install
