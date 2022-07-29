#include "mailgun.h"
#include "SmtpMime"
#include "message.h"

MailGun::MailGun(QObject *parent)
    : QObject{parent}
{

   // m_m_client = new SmtpClient("smtp.gmail.com",465,SmtpClient::SslConnection);
   // m_m_client->setUser(QString::fromStdString(bot_mail));
   // m_m_client->setPassword(QString::fromStdString(mail_pass));
   // m_m_client->connectToHost();
   // m_m_client->login();
}

void MailGun::setupConnection(const QString &host, int port, const QString &login, const QString &password)
{

    m_client = new SmtpClient(host,port,SmtpClient::SslConnection);
    m_client->setUser(login);
    m_client->setPassword(password);
    if (!m_client->connectToHost()) {
       qDebug() << "could not connect to provided host!";
    }
    else {
       qDebug() << "Connected to the host!";
    }
    if(!m_client->login()) {
       qDebug() << "could not login with provided credentials!";
    }
    else {
       qDebug() << "Connected with provided credentials!";
    }
}

bool MailGun::sendMessage(Message* message)
{
   message->setSender(m_client->getName());
   MimeMessage* mail = message->build();
   if (m_client->sendMail(*mail)){
       delete message;
       return true;
   }


   delete message;
   return false;
}

MailGun::~MailGun()
{
    m_client->quit();
}

void MailGun::beginMailing(Message *message)
{
    this->sendMessage(message);
}

void MailGun::beginConnection(const QString &host, int port, const QString &login, const QString &password)
{
        this->setupConnection(host,port,login,password);
}

