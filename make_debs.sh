#!/bin/sh

DEBEMAIL="djsftree@noip.org"
DEBFULLNAME="djsftree"

CMAKE_REPOS=" \
	lxqt-build-tools-0.11.0 \
	libqtxdg-3.9.0 \
	liblxqt-1.1.0 \
	libsysstat-0.4.6 \
	libfm-qt-1.1.0 \
	lxqt-themes-1.1.0 \
	pavucontrol-qt-1.1.0 \
	lxqt-about-1.1.0 \
	lxqt-admin-1.1.0 \
	lxqt-config-1.1.0 \
	lxqt-globalkeys-1.1.0 \
	lxqt-notificationd-1.1.0 \
	lxqt-openssh-askpass-1.1.0 \
	lxqt-policykit-1.1.0 \
	lxqt-powermanagement-1.1.0 \
	lxqt-qtplugin-1.1.0 \
	lxqt-session-1.1.0 \
	lxqt-sudo-1.1.0 \
	pcmanfm-qt-1.1.0 \
	lxqt-panel-1.1.0 \
	lxqt-runner-1.1.0 \
	lxqt-archiver-0.6.0 \
	lximage-qt-1.1.0 \
	qtermwidget-1.1.0 \
	qterminal-1.1.0 \
    	qps-2.5.0 \
	screengrab-2.4.0"

for package in ${CMAKE_REPOS}
do
	echo "\n\n Building: $package\n"
	cd $package
	mk-build-deps --install --root-cmd sudo --remove
	dch -a "compiled by djsftree"
	DEB_BUILD_OPTIONS='parallel=4' debuild -i -us -uc -b
	cd ..
done
