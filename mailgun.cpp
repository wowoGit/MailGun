#include "mailgun.h"
#include "SmtpMime"
#include "message.h"
#include <QThread>
#include <QNetworkProxy>
#include <QtQml/qqml.h>
MailGun::MailGun(QObject *parent)
    : QObject{parent}
{

    qRegisterMetaType<Status::ConnectionResult>();
    qmlRegisterUncreatableType<Status>("Status", 1, 0, "Status",
                                            "Not creatable as it is an enum type.");
}

void MailGun::setupConnection(const QString &host, int port, const QString &login, const QString &password, QNetworkProxy prox)
{

    if(m_client)
        delete m_client;


    m_client = new SmtpClient(host,port,SmtpClient::SslConnection);
    m_client->getSocket()->setProxy(prox);
    m_client->setUser(login);
    m_client->setPassword(password);
    if (!m_client->connectToHost()) {
       qDebug() << "could not connect to provided host!";
       qDebug() << m_client->getResponseText();
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
   auto list = message->getRecipients();
   auto it = list.begin();
   while(it != list.end())
   {
       int dist = std::distance(it, list.end());
       auto chunk = std::min(dist,50);
       auto n = std::next(it,chunk);
       for(int i = 0; i < chunk; i++) {
           qDebug() << i;
       }
       qDebug() << chunk;
       it+=chunk;
   }
   message->setSender(m_client->getName());
   MimeMessage* mail = message->build();

       Message m;
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

void MailGun::setProxy(QNetworkProxy proxy)
{

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
        QTcpSocket sock;
        QNetworkProxy prox;
        prox.setType(QNetworkProxy::Socks5Proxy);
        QString host1 = "98.178.72.21";
        int port1 = 10919;
        prox.setHostName(host1);
        prox.setPort(port1);
        sock.setProxy(prox);
        sock.connectToHost("www.example.com",5000);

        if(sock.waitForConnected()) {
            qDebug() << "Connected";
        }

        this->setupConnection(host,port,login,password,prox);
}

