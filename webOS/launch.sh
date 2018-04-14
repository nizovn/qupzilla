#!/bin/sh

APPS_DIR=/media/cryptofs/apps/usr/palm/applications
APP_DIR=${APPS_DIR}/com.nizovn.qupzilla

export QT_QPA_PLATFORM=webos
export QT_QPA_PLATFORM_PLUGIN_PATH=${APPS_DIR}/com.nizovn.qt5qpaplugins/plugins/platforms
export QT_QPA_FONTDIR=/usr/share/fonts

export QMLSCENE_DEVICE=softwarecontext
export QT_QPA_WEBOS_RIGHT_CLICK_ON_LONG_TAP=1
export SSL_CERT_FILE=${APPS_DIR}/com.nizovn.cacert/files/cacert.pem

${APP_DIR}/bin/qupzilla
