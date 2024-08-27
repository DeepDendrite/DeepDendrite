#for nvhpc docker:use openmpi instead of nvidia's
export PATH=/usr/bin:$PATH
export CC=gcc
export CXX=g++
autoreconf -ivf
./configure --prefix $PWD/../../install \
	--without-iv \
	--with-paranrn \
	--with-nrnpython=`which python`

make -j all
make install
