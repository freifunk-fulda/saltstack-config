#!/bin/bash

PACKAGE="batctl"
REMOTE="git://git.open-mesh.org/batctl.git"
TAG="v2016.2"
TARGET_VERSION="2016.2"
BUILD_ROOT="/usr/src/batctl"

rebuild_required() {
	REQUIRED=0

	local CURRENT_VERSION=$(batctl -v | awk '{ print $2 }')
	/usr/bin/dpkg --compare-versions "$CURRENT_VERSION" "eq" "$TARGET_VERSION"
	local CODE=$?
	if [ $CODE -ne 0 ]; then
		echo "[-] batctl version changed (${CURRENT_VERSION} to ${TARGET_VERSION})."
		REQUIRED=1
	fi

	if [ $REQUIRED -eq 0 ]; then
		echo "[+] batctl rebuild unnecessary."
		exit 0
	fi
}

prepare() {
	rm -rf $BUILD_ROOT
	git clone "$REMOTE" "$BUILD_ROOT"
	cd $BUILD_ROOT
	git checkout "$TAG"
}

build() {
	cd $BUILD_ROOT
	make -j$(nproc)
}

install() {
	cd $BUILD_ROOT
	checkinstall -y --nodoc --pkgname "${PACKAGE}" --pkgversion "${TARGET_VERSION}" --fstrans=no
}


rebuild_required
prepare
build
install
