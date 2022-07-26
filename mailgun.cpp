#include "mailgun.h"
#include "SmtpMime"
#include "message.h"

MailGun::MailGun(SmtpClient* m_client, QObject *parent)
    : QObject{parent}
{

   // m_m_client = new SmtpClient("smtp.gmail.com",465,SmtpClient::SslConnection);
   // m_m_client->setUser(QString::fromStdString(bot_mail));
   // m_m_client->setPassword(QString::fromStdString(mail_pass));
   // m_m_client->connectToHost();
   // m_m_client->login();
    if (!m_client->connectToHost()) {
       qDebug() << "could not connect to provided host!";
    }
    if(!m_client->login()) {
       qDebug() << "could not login with provided credentials!";
    }
}

void MailGun::setupConnection(const QString &host, int port, const QString &login, const QString &password)
{

    m_client = new SmtpClient(host,port,SmtpClient::SslConnection);
    m_client->setUser(login);
    m_client->setPassword(password);
    if (!m_client->connectToHost()) {
       qDebug() << "could not connect to provided host!";
    }
    if(!m_client->login()) {
       qDebug() << "could not login with provided credentials!";
    }
}

bool MailGun::sendMessage(const QString& header, const QString& body,const QString& recipient)
{
   MimeMessage* mail = new MimeMessage();
   mail->setSubject(header);
   auto mail_body = new MimeText(body);
   mail->addPart(mail_body);
   mail->addRecipient(new EmailAddress(recipient));
   mail->setSender(new EmailAddress(m_client->getUser()));
   if (m_client->sendMail(*mail)){
       delete mail;
       return true;
   }


   delete mail;
   return false;
}

MailGun::~MailGun()
{
    m_client->quit();
}
