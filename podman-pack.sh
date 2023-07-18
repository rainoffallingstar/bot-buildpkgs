#!/bin/bash

# 解压tar.gz文件
tar -xzf origin.tar.gz

# 复制文件到指定目录
cp -r origin/podman-desktop/ /opt/podman-desktop/

# 修改control文件的第二行
sed -i '2s/.*/Version: 1.2.0/' /opt/podman-desktop/DEBIAN/control

# 打包
dpkg-deb --build podman-desktop