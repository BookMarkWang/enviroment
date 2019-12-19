#!/bin/bash

#installation prefix
PREFIX=~/3rdparty/

basepath=$(cd `dirname $0`; pwd)

#ext path
GST_VERSION=1.14.5
GST_LIBAV=gst-libav-${GST_VERSION}
GST_BASE=gst-plugins-base-${GST_VERSION}
GST_GOOD=gst-plugins-good-${GST_VERSION}
GST_BAD=gst-plugins-bad-${GST_VERSION}
GST_UGLY=gst-plugins-ugly-${GST_VERSION}
GSTREAMER=gstreamer-${GST_VERSION}

GLIB_VERSION=2.40
GLIB=glib-${GLIB_VERSION}.2

#build glib
cd ${basepath}
if [ ! -d ${GLIB} ]; then
	tar -xvf ${GLIB}.tar.xz -C .
	cd ${basepath}/${GLIB}
	./configure --prefix=${PREFIX}
	make && make install
fi

#build gstreamer
cd ${basepath}
if [ ! -d ${GSTREAMER} ]; then
	tar -xvf ${GSTREAMER}.tar.xz -C .
	cd ${basepath}/${GSTREAMER}
	./configure --prefix=${PREFIX}
	make && make install
fi

#build gst-base
cd ${basepath}
if [ ! -d ${GST_BASE} ]; then
	cd ${basepath}
	tar -xvf ${GST_BASE}.tar.xz -C .
	cd ${basepath}/${GST_BASE}
	./configure --prefix=${PREFIX}
	make && make install
fi

#build gst-good
cd ${basepath}
if [ ! -d ${GST_GOOD} ]; then
	tar -xvf ${GST_GOOD}.tar.xz -C .
	cd ${basepath}/${GST_GOOD}
	./configure --prefix=${PREFIX}
	make && make install
fi

#build gst-bad
cd ${basepath}
if [ ! -d ${GST_BAD} ]; then
	cd ${basepath}
	tar -xvf ${GST_BAD}.tar.xz -C .
	cd ${basepath}/${GST_BAD}
	./configure --prefix=${PREFIX}
	make && make install
fi

#build gst-ugly
cd ${basepath}
if [ ! -d ${GST_UGLY} ]; then
	cd ${basepath}
	tar -xvf ${GST_UGLY}.tar.xz -C .
	cd ${basepath}/${GST_UGLY}
	./configure --prefix=${PREFIX}
	make && make install
fi

#build gst-libav
cd ${basepath}
if [ ! -d ${GST_LIBAV} ]; then
	cd ${basepath}
	tar -xvf ${GST_LIBAV}.tar.xz -C .
	cd ${basepath}/${GST_LIBAV}
	./configure --prefix=${PREFIX}
	make && make install
fi

