#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "QQmlContext"
#include "app.h"
#include "SmtpMime"
#include "filereader.h"
#ifdef QT_DEBUG
#include "livenodeengine.h"
#include "remotereceiver.h"
#endif
int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);
    app.setOrganizationDomain("OrgDomain");
    app.setOrganizationName("OrgName");


    App mail_app;
   // gun.sendMessage("vvs.seal@gmail.com","sad");

    QQmlApplicationEngine engine;
    QQmlContext *context = engine.rootContext();
    context->setContextProperty("app",&mail_app);
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    qmlRegisterType<FileReader>("FileReaders",1,0,"Freader");
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

#ifdef QT_DEBUG
    LiveNodeEngine node;

        // Let QmlLive know your runtime
        node.setQmlEngine(&engine);

        // Allow it to display QML components with non-QQuickWindow root object
        QQuickView fallbackView(&engine, 0);
        node.setFallbackView(&fallbackView);

        // Tell it where file updates should be stored relative to
        node.setWorkspace("F:\\qt projects\\MailGun\\MailGun",
                          LiveNodeEngine::AllowUpdates | LiveNodeEngine::UpdatesAsOverlay);

        // Listen to IPC call from remote QmlLive Bench
        RemoteReceiver receiver;
        receiver.registerNode(&node);
        receiver.listen(10234);

        QQuickWindow* window = qobject_cast<QQuickWindow *>(engine.rootObjects().first());

        // Advanced use: let it know the initially loaded QML component (do this
        // only after registering to receiver!)
        QList<QQmlError> warnings;
        node.usePreloadedDocument(url.toString(), window, warnings);
#endif

    return app.exec();
}
