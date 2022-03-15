#ifndef MAILGUN_H
#define MAILGUN_H

#include <QObject>

class MailGun : public QObject
{
    Q_OBJECT
public:
    explicit MailGun(QObject *parent = nullptr);
    void sendMessage(std::string recipient, std::string msg);
    Q_INVOKABLE void readFile(const QString& filename);
    ~MailGun();


private:
    std::string bot_mail;
    std::string mail_pass;
    class SmtpClient* client;



signals:

};

#endif // MAILGUN_H
