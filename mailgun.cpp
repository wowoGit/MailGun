#include "mailgun.h"
#include "SmtpMime"

MailGun::MailGun(QObject *parent)
    : QObject{parent}
{

    bot_mail = "RussianAggression2022@gmail.com";
    mail_pass = "Stopthewar1!";
    client = new SmtpClient("smtp.gmail.com",465,SmtpClient::SslConnection);
    client->setUser(QString::fromStdString(bot_mail));
    client->setPassword(QString::fromStdString(mail_pass));
    client->connectToHost();
    client->login();


}

void MailGun::sendMessage(std::string recipient, std::string msg)
{
   MimeMessage message;
   message.setSender(new EmailAddress(QString::fromStdString(bot_mail), "Народ Украины"));
   message.addRecipient(new EmailAddress(QString::fromStdString(recipient)));

   MimeText txt;
   txt.setText("Добрый день, прошу забрать своих ебаных уродов с нашей земли.");
   message.addPart(&txt);
   client->sendMail(message);
}

void MailGun::readFile(const QString &filename)
{
    QFile file(filename);
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text))
    {
        qDebug() << filename;
        return;
    }
    QTextStream stream(&file);
    auto line = stream.readAll();
    qDebug() << line;
    file.close();

}

MailGun::~MailGun()
{
    client->quit();
}
