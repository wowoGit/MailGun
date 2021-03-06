#ifndef APP_H
#define APP_H

#include <QObject>

class App : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QStringList recipients READ recipients NOTIFY recipientsChanged)
public:
    enum MessageStatus {
        SUCCESS,
        FAIL
    };

    explicit App(QObject *parent = nullptr);
    const QStringList& recipients() const;
    Q_INVOKABLE
    void sendAll(const QString& header, const QString& body, const QString& attached_files);
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
    void messageSent(size_t index, App::MessageStatus status);
    void readyToMail(Message*);
    void readyToRead(const QString&);
    void readyToConnect(const QString& host, int port, const QString& login, const QString& password );

public slots:
   void file_submitted(const QString& filepath);
   void connectToServer(const QString& host, int port, const QString& login, const QString& password );
private slots:
   void file_read(QStringList);

};

#endif // APP_H
