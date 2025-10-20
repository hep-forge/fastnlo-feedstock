#! /usr/bin/bash

cd ./v*/toolkit

libtoolize
autoheader

aclocal
autoconf
automake --add-missing

./configure --prefix=$PREFIX --with-zlib=$PREFIX --with-root=$PREFIX --with-yoda=$PREFIX --with-qcdnum=$PREFIX --with-hoppet=$PREFIX

make -j$(nproc)
lhapdf install CT10nlo

make check

make install
