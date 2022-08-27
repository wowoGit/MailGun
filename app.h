#ifndef APP_H
#define APP_H

#include <QObject>
#include "status.h"

class App : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QStringList recipients READ recipients NOTIFY recipientsChanged)
public:

    explicit App(QObject *parent = nullptr);
    const QStringList& recipients() const;
    Q_INVOKABLE
    void sendAll(const QString& header, const QString& body, const QStringList& attached_files);
    ~App();

private:
    class FileReader* m_freader = nullptr;
    class MailGun* m_mailgun = nullptr;
    class Message* mail = nullptr;
    class QThread* senderThread = nullptr;
    class QThread* readerThread = nullptr;
    QStringList m_recipients;


signals:
    void process_emails(QString emails_list);
    void recipientsChanged();
    void mailsSent(int rcptSize, Status::SendResult);
    void readyToMail(Message*, int chunksize);
    void readyToRead(const QString&);
    void readyToConnect(const QString& host, int port, const QString& login, const QString& password );
    void connectionResult(Status::ConnectionResult);

public slots:
   void file_submitted(const QString& filepath);
   void connectToServer(const QString& host, int port, const QString& login, const QString& password );
private slots:
   void file_read(QStringList);
   void quitThreads();

};

#endif // APP_H
