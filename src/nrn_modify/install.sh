export PATH=/usr/bin:$PATH
export CC=gcc
export CXX=g++
./configure --prefix $PWD/../../install \
	--without-iv \
	--with-paranrn \
	--with-nrnpython=`which python`

make -j all
make install
