#make sure we are using deep-dev-5.0
#lld installation
sudo apt-get install llvm-6.0 clang-6.0 lld-6.0 &&
sudo update-alternatives --install /usr/bin/ld ld /usr/bin/ld.bfd 10 &&
sudo update-alternatives --install /usr/bin/ld ld /usr/bin/ld.gold 10 &&
sudo update-alternatives --install /usr/bin/ld ld /usr/bin/lld-6.0 10 &&

#Now you can easily switch between different linkers with:
sudo update-alternatives --config ld &&

cmake -DCMAKE_INSTALL_PREFIX=run .. -DCMAKE_BUILD_TYPE="Debug" -DCMAKE_LINKER="lld-6.0" -DCMAKE_CXX_COMPILER="clang++-6.0" -DCMAKE_C_COMPILER="clang-6.0" -GNinja -DCMAKE_EXPORT_COMPILE_COMMANDS=1
