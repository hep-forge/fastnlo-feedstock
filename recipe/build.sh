#! /usr/bin/bash
set -e

cd ./v*/toolkit
export PYTHONPATH=$SP_DIR

autoreconf -vfi

# Bundled/regenerated config.sub/config.guess predate aarch64 triplets --
# replace with the current ones from the gnuconfig package before configuring.
for f in config.sub config.guess; do
  find . -name "$f" -exec cp "$BUILD_PREFIX/share/gnuconfig/$f" {} \;
done

./configure --prefix=$PREFIX --with-zlib=$PREFIX --enable-fortranext \
            --with-root=$PREFIX --with-lhapdf=$PREFIX \
            --with-yoda=$PREFIX --with-fastjet=$PREFIX --with-hoppet=$PREFIX

NPROC=$(nproc 2>/dev/null || sysctl -n hw.ncpu)
make -j$NPROC
lhapdf install CT10nlo

make check
make install
