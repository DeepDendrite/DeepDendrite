rm -rf build
mkdir build
cd build
# module purge

#change to your modulefile path
#module load /opt/nvidia/hpc_sdk/modulefiles/nvhpc-hpcx-cuda12/24.7
# for older versions of pgi, load the moduleflie as following
# module load /path/to/your/pgi/modulefiles/pgi/19.10
# module load /path/to/your/pgi/modulefiles/openmpi/3.1.3/2019
export CC=mpicc
export CXX=mpicxx

COMMON_FLAGS="-lrt -g -O0 -mp -mno-abm"
cmake .. \
	-DCMAKE_C_FLAGS:STRING="$COMMON_FLAGS" \
	-DCMAKE_CXX_FLAGS:STRING="$COMMON_FLAGS -std=c++11" \
	-DCOMPILE_LIBRARY_TYPE=STATIC \
	-DCMAKE_INSTALL_PREFIX="../../../install" \
	-DADDITIONAL_MECHPATH="../../all_mechanisms" \
	-DCUDA_HOST_COMPILER=`which gcc-13` \
	-DCUDA_PROPAGATE_HOST_FLAGS=OFF \
	-DENABLE_SELECTIVE_GPU_PROFILING=ON \
	-DENABLE_OPENACC=ON \
	-DAUTO_TEST_WITH_SLURM=OFF \
	-DAUTO_TEST_WITH_MPIEXEC=OFF \
	-DFUNCTIONAL_TESTS=OFF \
	-DUNIT_TESTS=OFF
make -j all
make install
