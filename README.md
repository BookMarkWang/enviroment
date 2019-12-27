# enviroment
build gstreamer on ubuntu just with make command. similar to buildroot

为了方便在虚拟机上安装测试gstreamer程序， 所以仿照buildroot的结构，编写了这个makefile。

clone项目后需要修改根目录下Makefile中的BUILD_DIR和INSTALL_DIR。否则使用当前目录。

可用命令：
make 直接编译所有package中的项目。

make [package name] 编译单独的某个库。例如：make gstreamer 或 make gst-plugins-bad. package name 是package下的.mk的名字。

当前支持：glib, ffmpeg, gstreamer

PS: you should install make gcc g++ first. after build should set the enviroment before build your own project.

