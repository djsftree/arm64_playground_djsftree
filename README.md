add ppa to apt sources.list

```deb-src https://ppa.launchpadcontent.net/severusseptimius/lxqt/ubuntu jammy main```

fetch the source
```
apt update && apt install equivs && apt source --allow-unauthenticated lxqt-build-tools libqtxdg liblxqt libsysstat \
    libfm-qt lxqt-themes pavucontrol-qt lxqt-about lxqt-admin lxqt-config lxqt-globalkeys lxqt-notificationd \
    lxqt-openssh-askpass lxqt-policykit lxqt-powermanagement lxqt-qtplugin lxqt-session lxqt-sudo pcmanfm-qt lxqt-panel \
    lxqt-runner lxqt-archiver lximage-qt qtermwidget qterminal qps screengrab
    
wget https://raw.githubusercontent.com/djsftree/arm64_playground_djsftree/main/make_debs.sh

sh make_debs.sh
```
