# docker-onion-omega
Dockerfile for rolling out a dev env for the onion omega.

As of right now, this is probably wrong, but it outlines, roughly, what I have to do to get a base OpenWRT toolchain.

After booting up, you will still need to run:
<br>

<code>
make defconfig

make prereq

make menuconfig

make
</code>

in order to build the OpenWRT toolchain.  Then, you'll need to follow the instructions at: https://github.com/netbeast/docs/wiki/Cross-Compile-Nodejs-for-OpenWrt
to compile node.js.  One step the instructions forgot was to set up RANLIB variable.
</p>

<p>
This image's export commands would thusly look like:
<br>

<code>
export AR=/openwrt/staging_dir/toolchain-mips_34kc_
gcc-4.8-linaro_musl-1.1.11/bin/mips-openwrt-linux-ar

export CC=/openwrt/staging_dir/toolchain-mips_34kc_
gcc-4.8-linaro_musl-1.1.11/bin/mips-openwrt-linux-gcc

export CXX=/openwrt/staging_dir/toolchain-mips_34kc_
gcc-4.8-linaro_musl-1.1.11/bin/mips-openwrt-linux-g++

export LINK=/openwrt/staging_dir/toolchain-mips_34kc_
gcc-4.8-linaro_musl-1.1.11/bin/mips-openwrt-linux-g++

export RANLIB=/openwrt/staging_dir/toolchain-mips_34kc_
gcc-4.8-linaro_musl-1.1.11/bin/mips-openwrt-linux-ranlib

export STAGING_DIR=/openwrt/staging_dir/

export LIBPATH=/openwrt/staging_dir/toolchain-mips_34kc_
gcc-4.8-linaro_musl-1.1.11/lib

export LDFLAGS='-Wl,-rpath-link '${LIBPATH}

export PATH=$PATH:/openwrt/staging_dir/toolchain-mips_34kc_
gcc-4.8-linaro_musl-1.1.11/bin
</code>
</p>
