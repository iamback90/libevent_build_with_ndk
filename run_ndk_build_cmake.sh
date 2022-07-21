#!/bin/bash
ANDROID_NDK=/home/feng/workspace/as-houyi/android-ndk-r19c

rm -rf build_dir && mkdir -p build_dir/install_dir && cd build_dir &&
cmake   -DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK/build/cmake/android.toolchain.cmake \
        -DANDROID_ABI="arm64-v8a" \
	-DANDROID_NDK=$ANDROID_NDK \
	-DANDROID_PLATFORM=android-28 \
	-DBUILD_SHARED_LIBS=true\
	-DCMAKE_BUILD_TYPE=Release\
	-DCMAKE_INSTALL_PREFIX=./install_dir \
	-DOPENSSL_CRYPTO_LIBRARY=/home/feng/packages/libevent_install/lib/libcrypto.so \
        -DOPENSSL_SSL_LIBRARY=/home/feng/packages/libevent_install/lib/libssl.so \
        -DOPENSSL_INCLUDE_DIR=/home/feng/packages/libevent_install/include \
	.. && make && make install

# Display all cmake setable variables
# cmake -LAH ..
