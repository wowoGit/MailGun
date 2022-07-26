#ifndef MAILGUN_H
#define MAILGUN_H

#include <QObject>


class MimeMessage;

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
    explicit MailGun(class SmtpClient* smtp_client,QObject *parent = nullptr);
    void setupConnection(const QString& host, int port, const QString& login, const QString& password);
    bool sendMessage(const QString& header, const QString& body,const QString& recipient);
    ~MailGun();


private:
    SmtpClient* m_client;



signals:

};

#endif // MAILGUN_H
