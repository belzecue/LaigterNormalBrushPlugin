TEMPLATE      = lib
CONFIG       += plugin
QT           += widgets
INCLUDEPATH  += ../laigter/
INCLUDEPATH  += ../laigter/src/

HEADERS += \
  src/normalbrushgui.h \
  src/normalbrushplugin.h \
  src/normalselectorwidget.h \
  ../laigter/src/imageprocessor.h \
  ../laigter/src/lightsource.h\

SOURCES += \
  src/normalbrushgui.cpp \
  src/normalbrushplugin.cpp \
  src/normalselectorwidget.cpp \
  ../laigter/src/imageprocessor.cpp\
  ../laigter/src/lightsource.cpp \

FORMS += \
  src/normalbrushgui.ui

CONFIG += install_ok  # Do not cargo-cult this!
uikit: CONFIG += debug_and_release

DISTFILES += \
  shaders/sphere_fragment.glsl \
  shaders/sphere_vertex.glsl

RESOURCES += \
  icons.qrc \
  shaders.qrc

unix{
    CONFIG += link_pkgconfig
    packagesExist(opencv4){
        PKGCONFIG += opencv4
        DEFINES += CV_RGBA2GRAY=COLOR_RGBA2GRAY
        DEFINES += CV_RGB2GRAY=COLOR_RGB2GRAY
        DEFINES += CV_GRAY2RGB=COLOR_GRAY2RGB
        DEFINES += CV_GRAY2RGBA=COLOR_GRAY2RGBA
        DEFINES += CV_DIST_L2=DIST_L2
    } else {
        PKGCONFIG += opencv
    }
}

win32: LIBS += C:\opencv-build\install\x64\mingw\bin\libopencv_core320.dll
win32: LIBS += C:\opencv-build\install\x64\mingw\bin\libopencv_imgproc320.dll
win32: LIBS += C:\opencv-build\install\x64\mingw\bin\libopencv_imgcodecs320.dll

win32: INCLUDEPATH += C:\opencv\build\include
