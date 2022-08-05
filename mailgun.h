#ifndef MAILGUN_H
#define MAILGUN_H

#include <QObject>
#include "status.h"


class Message;

class MailGun : public QObject
{

    Q_OBJECT
public:
    struct MailInfo
    {
       QString sender_name;
       QString message;
       QString recipient_address;
       QVector<class QFile*> attached_files;
    };

    explicit MailGun(QObject *parent = nullptr);
    void setupConnection(const QString& host, int port, const QString& login, const QString& password);
    bool sendMessage(Message* message);
    ~MailGun();


private:
    class SmtpClient* m_client = nullptr;

public slots:
    void beginMailing(Message*);
    void beginConnection(const QString &host, int port, const QString &login, const QString &password);

signals:
    void mailingFinished();
    void connectionResult(Status::ConnectionResult);



};

#endif // MAILGUN_H
