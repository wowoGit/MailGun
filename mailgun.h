#ifndef MAILGUN_H
#define MAILGUN_H

#include <QObject>

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
    bool sendMessage(const MailInfo& mail_info);
    ~MailGun();


private:
    SmtpClient* m_client;



signals:

};

#endif // MAILGUN_H
