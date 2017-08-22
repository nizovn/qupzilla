export PROJECT=com.nizovn.qupzilla
export STAGING_DIR=./STAGING/$PROJECT
QT5_WEBOS_PATH=/home/nizovn/webos/qt5/qt5.9
RUNTIME=${QT5_WEBOS_PATH}/runtime
GCC_WEBOS_PATH=${QT5_WEBOS_PATH}/gcc-linaro-4.8-2015.06-x86_64_arm-linux-gnueabi/arm-linux-gnueabi

rm -rf $STAGING_DIR
rm *.ipk

mkdir -p $STAGING_DIR
mkdir -p $STAGING_DIR/runtime/qt5/lib

cp -RfL $RUNTIME/lib/*.so.5  $STAGING_DIR/runtime/qt5/lib/
cp -RfL $RUNTIME/plugins $STAGING_DIR/runtime/qt5/

cp -RfL $RUNTIME/qml $STAGING_DIR/runtime/qt5/
cp -RfL $RUNTIME/libexec $STAGING_DIR/runtime/qt5/
cp -RfL $RUNTIME/resources/* $STAGING_DIR/runtime/qt5/libexec/
cp -RfL $RUNTIME/translations/* $STAGING_DIR/runtime/qt5/libexec/

mkdir -p $STAGING_DIR/runtime/ssl
cp -RfL $QT5_WEBOS_PATH/device/lib/libcrypto.so.1.0.0 $STAGING_DIR/runtime/ssl/
cp -RfL $QT5_WEBOS_PATH/device/lib/libssl.so.1.0.0 $STAGING_DIR/runtime/ssl/
cp ./cacert.pem $STAGING_DIR/runtime/ssl

mkdir -p $STAGING_DIR/runtime/linaro
cp -RfL $GCC_WEBOS_PATH/libc/usr/lib $STAGING_DIR/runtime/linaro/

cp ./appinfo.json $STAGING_DIR
cp ./jail.conf $STAGING_DIR
cp ./pmPostInstall.script $STAGING_DIR
cp ./pmPreRemove.script $STAGING_DIR
cp ./package.properties $STAGING_DIR

cp -Rfl ../bin/qupzilla $STAGING_DIR/runtime/qt5/libexec/
cp -Rfl ../bin/libQupZilla.so.2 $STAGING_DIR/runtime/qt5/libexec/
cp -Rfl ../bin/locale $STAGING_DIR/runtime/qt5/libexec/
cp -Rfl ../bin/plugins $STAGING_DIR/runtime/qt5/libexec/
cp -Rfl ../bin/themes $STAGING_DIR/runtime/qt5/libexec/

cp ../linux/hicolor/64x64/apps/qupzilla.png $STAGING_DIR

palm-package $STAGING_DIR

ar q ${PROJECT}_*.ipk pmPostInstall.script
ar q ${PROJECT}_*.ipk pmPreRemove.script
