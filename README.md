# docker-onion-omega
Dockerfile for rolling out a dev env for the onion omega.

As of right now, this is probably wrong, but it outlines, roughly, what I have to do to get a base OpenWRT toolchain.

After booting up, you _normally_ would run:
```shell
make defconfig
make prereq
make menuconfig
make
```
but I have included all commands up until the
```shell
make
```
command to just have this awaiting a 'make -j8' on container bringup.

Then, you'll need to follow the instructions at: https://github.com/netbeast/docs/wiki/Cross-Compile-Nodejs-for-OpenWrt
to compile node.js.  One step the instructions forgot was to set up RANLIB variable.
</p>
Following the node.js cross-compile instructions above, this image's export commands would thusly look like:
<br>
```shell
export AR=/openwrt/staging_dir/toolchain-mips_34kc_gcc-4.8-linaro_musl-1.1.11/bin/mips-openwrt-linux-ar
export CC=/openwrt/staging_dir/toolchain-mips_34kc_gcc-4.8-linaro_musl-1.1.11/bin/mips-openwrt-linux-gcc
export CXX=/openwrt/staging_dir/toolchain-mips_34kc_gcc-4.8-linaro_musl-1.1.11/bin/mips-openwrt-linux-g++
export LINK=/openwrt/staging_dir/toolchain-mips_34kc_gcc-4.8-linaro_musl-1.1.11/bin/mips-openwrt-linux-g++
export RANLIB=/openwrt/staging_dir/toolchain-mips_34kc_gcc-4.8-linaro_musl-1.1.11/bin/mips-openwrt-linux-ranlib
export STAGING_DIR=/openwrt/staging_dir/
export LIBPATH=/openwrt/staging_dir/toolchain-mips_34kc_gcc-4.8-linaro_musl-1.1.11/lib
export LDFLAGS='-Wl,-rpath-link '${LIBPATH}
export PATH=$PATH:/openwrt/staging_dir/toolchain-mips_34kc_gcc-4.8-linaro_musl-1.1.11/bin
```
