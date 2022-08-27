#ifndef MAILGUN_H
#define MAILGUN_H

#include <QObject>
#include "status.h"


class Message;
class QNetworkProxy;

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
    ~MailGun();


private:
    class QTimer* m_timer;
    Message* m_message = nullptr;
    class SmtpClient* m_client = nullptr;
    QStringList::const_iterator wstart;

public slots:
    void beginMailing(Message* m, int chunksize);
    void beginConnection(const QString &host, int port, const QString &login, const QString &password);
private slots:
    bool sendMessage(QStringList::const_iterator wstart, QStringList::const_iterator wend);

signals:
    void mailingFinished();
    void connectionResult(Status::ConnectionResult);
    void sendResult(int rcptSize, Status::SendResult);



};

#endif // MAILGUN_H
