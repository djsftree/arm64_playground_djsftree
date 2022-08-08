#!/bin/sh

DEBEMAIL="djsftree@noip.org"
DEBFULLNAME="djsftree"
export DEBEMAIL DEBFULLNAME
export DEBUILD_DPKG_BUILDPACKAGE_OPTS="-d"

apt install -y qtbase5-private-dev libqt5svg5-dev qttools5-dev libqt5x11extras5-dev libpolkit-qt5-1-dev
apt install -y libkf5guiaddons-dev libkf5idletime-dev libkf5screen-dev libkf5windowsystem-dev libkf5solid-dev
apt install -y bash libstatgrab-dev libudev-dev libasound2-dev libpulse-dev libsensors4-dev libconfig-dev \
  libmuparser-dev libupower-glib-dev libpolkit-agent-1-dev libpolkit-qt5-1-dev sudo libexif-dev x11-utils \
  libxss-dev libxcursor-dev libxcomposite-dev libxcb-composite0-dev libxcb-damage0-dev libxcb-dpms0-dev \
  libxcb-image0-dev libxcb-screensaver0-dev libxcb-util0-dev libxkbcommon-x11-dev libdbusmenu-qt5-dev \
  libfm-dev libmenu-cache-dev lxmenu-data gtk-update-icon-cache hicolor-icon-theme xdg-utils xdg-user-dirs \
  oxygen-icon-theme openbox-dev libxi-dev xserver-xorg-input-libinput-dev libxcb-randr0-dev libxdamage-dev \
  libjson-glib-dev libx11-xcb-dev libjson-glib-dev libprocps-dev libxtst-dev dh-exec libutf8proc-dev \
  libmagic-dev libsystemd-dev

apt source -y lxqt-build-tools libqtxdg liblxqt libsysstat qtxdg-tools \
  libfm-qt lxqt-themes pavucontrol-qt lxqt-about lxqt-admin lxqt-config lxqt-globalkeys lxqt-notificationd \
  lxqt-openssh-askpass lxqt-policykit lxqt-powermanagement lxqt-session lxqt-sudo pcmanfm-qt lxqt-panel \
  lxqt-runner lxqt-archiver lximage-qt qtermwidget qterminal qps screengrab


cd lxqt-build-tools-0.11.0
dch -a "compiled by djsftree"
debuild -i -us -uc -b
cd ..
rm *dbgsym*.deb
rm *l10n*.deb
dpkg -i lxqt-build-tools*.deb


cd libqtxdg-3.9.1
dch -a "compiled by djsftree"
debuild -i -us -uc -b
cd ..
rm *dbgsym*.deb
rm *l10n*.deb
dpkg -i libqt5xdg*.deb
dpkg -i qtxdg-dev-tools*.deb


cd qtxdg-tools-3.9.1
dch -a "compiled by djsftree"
debuild -i -us -uc -b
cd ..
rm *dbgsym*.deb
rm *l10n*.deb
dpkg -i qtxdg-tools*.deb


cd liblxqt-1.1.0
dch -a "compiled by djsftree"
debuild -i -us -uc -b
cd ..
rm *dbgsym*.deb
rm *l10n*.deb
dpkg -r --force-depends liblxqt0
dpkg -r --force-depends liblxqt0-dev
dpkg -r --force-depends liblxqt-globalkeys-ui0
dpkg -r --force-depends liblxqt-globalkeys0
dpkg -i liblxqt*.deb


cd libsysstat-0.4.6
dch -a "compiled by djsftree"
debuild -i -us -uc -b
cd ..
rm *dbgsym*.deb
rm *l10n*.deb
dpkg -i libsysstat*.deb


cd libfm-qt-1.1.0
dch -a "compiled by djsftree"
debuild -i -us -uc -b
cd ..
rm *dbgsym*.deb
rm *l10n*.deb
dpkg -r --force-depends libfm-qt8
dpkg -i libfm-qt-common*.deb
dpkg -i libfm-qt11*.deb
dpkg -i libfm-qt-dev*.deb



CMAKE_REPOS=" \
    lxqt-themes-1.1.0 \
    pavucontrol-qt-1.1.0 \
    qtermwidget-1.1.0"
    
for package in ${CMAKE_REPOS}
do
    echo "\n\n Building: $package\n"
    cd $package
    dch -a "compiled by djsftree"
    debuild -i -us -uc -b
    cd ..
    rm *dbgsym*.deb
    rm *l10n*.deb
done


dpkg -r --force-depends libqtermwidget5-0
dpkg -i lxqt-themes*.deb
dpkg -i lxqt-system-theme*.deb
dpkg -i pavucontrol*.deb
dpkg -i libqtermwidget*.deb
dpkg -i qtermwidget*.deb



git clone --branch debian/experimental https://salsa.debian.org/lxqt-team/lxqt-qtplugin.git lxqt-qtplugin-1.1.0

CMAKE_REPOS=" \
    lxqt-about-1.1.0 \
    lxqt-admin-1.1.0 \
    lxqt-config-1.1.0 \
    lxqt-globalkeys-1.1.0 \
    lxqt-notificationd-1.1.0 \
    lxqt-openssh-askpass-1.1.0 \
    lxqt-policykit-1.1.0 \
    lxqt-powermanagement-1.1.0 \
    lxqt-qtplugin-1.1.0 \
    lxqt-session-1.1.1 \
    lxqt-sudo-1.1.0 \
    pcmanfm-qt-1.1.0 \
    lxqt-panel-1.1.0 \
    lxqt-runner-1.1.0 \
    lxqt-archiver-0.6.0 \
    lximage-qt-1.1.0 \
    qterminal-1.1.0 \
    qps-2.5.0 \
    screengrab-2.4.0"

for package in ${CMAKE_REPOS}
do
    echo "\n\n Building: $package\n"
    cd $package
    dch -a "compiled by djsftree"
    debuild -i -us -uc -b
    cd ..
    rm *dbgsym*.deb
    rm *l10n*.deb
done

dpkg -i lxqt-about*.deb
dpkg -i lxqt-admin*.deb
dpkg -i lxqt-config*.deb
dpkg -i liblxqt-globalkeys*.deb
dpkg -i lxqt-globalkeys*.deb
dpkg -i lxqt-notificationd*.deb
dpkg -i lxqt-openssh-askpass*.deb
dpkg -i lxqt-session*.deb
dpkg -i lxqt-policykit*.deb
dpkg -i lxqt-powermanagement*.deb
dpkg -i lxqt-qtplugin*.deb
dpkg -i lxqt-sudo*.deb
dpkg -i pcmanfm-qt*.deb
dpkg -i lxqt-panel*.deb
dpkg -i lxqt-runner*.deb
dpkg -i lxqt-archiver*.deb
dpkg -i lximage-qt*.deb
dpkg -i qterminal*.deb
dpkg -i qps*.deb
dpkg -i screengrab*.deb
