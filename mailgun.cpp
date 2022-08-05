#include "mailgun.h"
#include "SmtpMime"
#include "message.h"
#include <QThread>
#include <QtQml/qqml.h>
MailGun::MailGun(QObject *parent)
    : QObject{parent}
{

    qRegisterMetaType<Status::ConnectionResult>();
    qmlRegisterUncreatableType<Status>("Status", 1, 0, "Status",
                                            "Not creatable as it is an enum type.");
}

void MailGun::setupConnection(const QString &host, int port, const QString &login, const QString &password)
{

    if(m_client)
        delete m_client;


    m_client = new SmtpClient(host,port,SmtpClient::SslConnection);
    m_client->setUser(login);
    m_client->setPassword(password);
    if (!m_client->connectToHost()) {
       qDebug() << "could not connect to provided host!";
       emit connectionResult(Status::ConnectionResult::CONNECTION_FAIL);
       return;
    }
    else {
       qDebug() << "Connected to the host!";
    }
    if(!m_client->login()) {
       qDebug() << "could not login with provided credentials!";
       emit connectionResult(Status::ConnectionResult::LOGIN_FAIL);
       return;
    }
       qDebug() << "Connected with provided credentials!";
       emit connectionResult(Status::ConnectionResult::CONNECTION_SUCCESS);
}

bool MailGun::sendMessage(Message* message)
{
   message->setSender(m_client->getName());
   MimeMessage* mail = message->build();
   if (m_client->sendMail(*mail)){
       delete message;
       //return true;
   }
   QThread::sleep(5);
   auto text = m_client->getResponseText();
   auto code = m_client->getResponseCode();
   qDebug() << text << code;
    return true;

   delete message;
   return false;
}

MailGun::~MailGun()
{
    if (m_client)
    m_client->quit();

    delete m_client;
}

void MailGun::beginMailing(Message *message)
{
    this->sendMessage(message);
}

void MailGun::beginConnection(const QString &host, int port, const QString &login, const QString &password)
{
        this->setupConnection(host,port,login,password);
}

