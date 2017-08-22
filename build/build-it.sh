APP_RUNPATH="/media/cryptofs/apps/usr/palm/applications/com.nizovn/qupzilla/runtime/qt5/libexec"

export PORTABLE_BUILD="true"
export NO_X11="true"
export USE_LIBPATH=${APP_RUNPATH}
export SHARE_FOLDER=${APP_RUNPATH}
export QUIPZILLA_PREFIX=${APP_RUNPATH}
export NO_SYSTEM_DATAPATH="true"
export DISABLE_DBUS="true"
/home/nizovn/webos/qt5/qt5.9/runtime/host/bin/qmake ../QupZilla.pro -o Makefile
make -j8
