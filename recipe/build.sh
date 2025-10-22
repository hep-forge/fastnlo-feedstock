#! /usr/bin/bash

cd ./v*/toolkit
export PYTHONPATH=$SP_DIR

autoreconf -vfi

./configure --prefix=$PREFIX --with-zlib=$PREFIX \
            --enable-pyext --enable-fortranext --disable-dependency-tracking
            # --with-root=$PREFIX --with-lhapdf=$PREFIX \
            # --with-yoda=$PREFIX --with-qcdnum=$PREFIX --with-fastjet=$PREFIX --with-hoppet=$PREFIX \
            # --disable-dependency-tracking

make -j$(nproc)
lhapdf install CT10nlo

make check
make install
