QT += quick

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        mailgun.cpp \
        main.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../build-SMTPEmail-Desktop_Qt_5_15_2_MinGW_64_bit-Debug/release/ -lSMTPEmail
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../build-SMTPEmail-Desktop_Qt_5_15_2_MinGW_64_bit-Debug/debug/ -lSMTPEmail
else:unix: LIBS += -L$$PWD/../../build-SMTPEmail-Desktop_Qt_5_15_2_MinGW_64_bit-Debug/ -lSMTPEmail

INCLUDEPATH += $$PWD/../../SmtpClient-for-Qt/src
DEPENDPATH += $$PWD/../../SmtpClient-for-Qt/src

HEADERS += \
    mailgun.h
