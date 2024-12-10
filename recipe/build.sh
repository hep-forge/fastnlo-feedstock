#! /usr/bin/bash

cd ./v*/toolkit

libtoolize
autoheader

aclocal
autoconf
automake --add-missing

./configure --prefix=$PREFIX

make -j$(nproc)
lhapdf install CT10nlo

make check

make install