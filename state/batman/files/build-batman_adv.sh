#!/bin/bash

PACKAGE="batman-adv"
REMOTE="git://git.open-mesh.org/batman-adv.git"
TAG="v2016.2"
KMOD_VERSION="2016.2"
BUILD_ROOT="/usr/src/batman-adv"
TARGET_KERNEL=$(dpkg -s linux-image-amd64 | grep "^Depends" | sed 's/Depends:\s*linux-image-//')

rebuild_required() {
	REQUIRED=0

	# check kernel version in vermagic
	local KMOD_VERMAGIC=$(/sbin/modinfo -k $TARGET_KERNEL batman-adv --field vermagic | awk '{ print $1 }')
	if [[ $KMOD_VERMAGIC != $TARGET_KERNEL ]]; then
		echo "[-] Kernel version changed (${KMOD_VERMAGIC} to ${TARGET_KERNEL})."
		REQUIRED=1
	fi

	# check kmod version
	local KMOD_CURRENT=$(/sbin/modinfo -k $TARGET_KERNEL batman-adv --field version)

	/usr/bin/dpkg --compare-versions "$KMOD_CURRENT" "eq" "$KMOD_VERSION"
	local CODE=$?
	if [ $CODE -ne 0 ]; then
		echo "[-] batman-adv version changed (${KMOD_CURRENT} to ${KMOD_VERSION})."
		REQUIRED=1
	fi

	if [ $REQUIRED -eq 0 ]; then
		echo "[+] batman-adv rebuild unnecessary."
		exit 0
	fi
}

prepare() {
	rm -rf $BUILD_ROOT
	git clone "$REMOTE" "$BUILD_ROOT"
	cd $BUILD_ROOT
	git checkout "$TAG"

	# apply patches if they exist
	if [ -d /usrc/src/$PACKAGE_patches/ ]; then
		git am /usr/src/$PACKAGE_patches/*
	fi
}

build() {
	cd $BUILD_ROOT
	export KERNELPATH=/lib/modules/$TARGET_KERNEL/build
	make -j$(nproc)
}

install() {
	cd $BUILD_ROOT
	checkinstall -y --nodoc --pkgname "${PACKAGE}" --pkgversion "${KMOD_VERSION}" --fstrans=no
	depmod
}


rebuild_required
prepare
build
install
