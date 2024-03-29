QT += quick
CONFIG+=qml_debug
# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0
HEADERS += mailgun.h \
    app.h \
    filereader.h \
    message.h \
    status.h

SOURCES += \
        app.cpp \
        filereader.cpp \
        mailgun.cpp \
        main.cpp \
        message.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/include/SMTPClient/lib/ -lSMTPEmail
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/include/SMTPClient/lib/ -lSMTPEmail
else:unix: LIBS += -L$$PWD/include/SMTPClient/lib/ -lSMTPEmail

INCLUDEPATH += $$PWD/include/SMTPClient/src
DEPENDPATH += $$PWD/include/SMTPClient/src

#QML Live
INCLUDEPATH += $$[QT_INSTALL_HEADERS]/qmllive
LIBS += -L$$[QT_INSTALL_LIBS] -lqmllive5
 DEFINES += SRCDIR=\\\"$$PWD/\\\"

DISTFILES += \
    js/func.js
