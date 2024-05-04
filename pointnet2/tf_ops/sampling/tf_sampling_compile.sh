#/bin/bash
/usr/local/cuda-12.4/bin/nvcc -std=c++17 -c -o tf_sampling_g.cu.o tf_sampling_g.cu.cc \
    -I /home/hao/.pyenv/versions/pointnet2/lib/python3.10/site-packages/tensorflow/include -D_GLIBCXX_USE_CXX11_ABI=1 --std=c++17 -DEIGEN_MAX_ALIGN_BYTES=64 -D GOOGLE_CUDA=1 -x cu -Xcompiler -fPIC
    
g++ -std=c++17 -shared -o tf_sampling_so.so tf_sampling.cpp \
  tf_sampling_g.cu.o -I /home/hao/.pyenv/versions/pointnet2/lib/python3.10/site-packages/tensorflow/include -D_GLIBCXX_USE_CXX11_ABI=1 --std=c++17 -DEIGEN_MAX_ALIGN_BYTES=64 -fPIC -lcudart -L /usr/local/cuda-12.4/lib64/ -L /home/hao/.pyenv/versions/pointnet2/lib/python3.10/site-packages/tensorflow -l:libtensorflow_framework.so.2

# TF1.4
#g++ -std=c++11 tf_sampling.cpp tf_sampling_g.cu.o -o tf_sampling_so.so -shared -fPIC -I /usr/local/lib/python2.7/dist-packages/tensorflow/include -I /usr/local/cuda-8.0/include -I /usr/local/lib/python2.7/dist-packages/tensorflow/include/external/nsync/public -lcudart -L /usr/local/cuda-8.0/lib64/ -L/usr/local/lib/python2.7/dist-packages/tensorflow -ltensorflow_framework -O2 -D_GLIBCXX_USE_CXX11_ABI=0
