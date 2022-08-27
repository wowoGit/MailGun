#include "mailgun.h"
#include "SmtpMime"
#include <QTimer>
#include "message.h"
#include <QThread>
#include <QtQml/qqml.h>
MailGun::MailGun(QObject *parent)
    : QObject{parent}
{

    qRegisterMetaType<Status::ConnectionResult>();
    qRegisterMetaType<Status::SendResult>();
    qmlRegisterUncreatableType<Status>("Status", 1, 0, "Status",
                                            "Not creatable as wstart is an enum type.");
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
       qDebug() << m_client->getResponseText();
       emit connectionResult(Status::ConnectionResult::CONNECTION_FAIL);
       return;
    }
    else {
       qDebug() << "Connected to the host!";
    }
    if(!m_client->login()) {
       qDebug() << "could not login wwstarth provided credentials!";
       emit connectionResult(Status::ConnectionResult::LOGIN_FAIL);
       return;
    }
       qDebug() << "Connected wwstarth provided credentials!";
       emit connectionResult(Status::ConnectionResult::CONNECTION_SUCCESS);
}

bool MailGun::sendMessage(QStringList::const_iterator wstart, QStringList::const_iterator wend)
{
   auto list = m_message->getRecipients();
   m_message->setSender(m_client->getName());
   MimeMessage* mail = m_message->build();
   std::for_each(wstart,wend, [mail] (const QString& email) {
        mail->addCc(new EmailAddress(email));
   });

   if (m_client->sendMail(*mail)){
       m_client->quit();
       return true;
   }
    return false;
}


MailGun::~MailGun()
{
    if (m_client)
    m_client->quit();
    delete m_message;

    delete m_client;
}

void MailGun::beginMailing(Message *message, int chunksize)
{

    if(m_message) {
        delete m_message;
    }
   m_message = message;
   m_timer = new QTimer(this);

   m_timer->setInterval(300);
   wstart = m_message->getRecipients().constBegin();
   m_timer->connect(m_timer,&QTimer::timeout, this, [this,chunksize]() {
       qDebug() << "slot call";
    auto list = m_message->getRecipients();
       if(wstart == list.constEnd()){
            m_timer->stop();
            return;
       }

       int dist = std::distance(wstart, list.constEnd());
       auto chunk = std::min(dist,chunksize);
       auto wend = std::next(wstart,chunk);
       bool result = sendMessage(wstart,wend);
       if (result == true) {
           emit sendResult(chunk, Status::SendResult::SEND_SUCCESS);
       }
       else {
           emit sendResult(chunk, Status::SendResult::SEND_ERROR);
       }
       wstart+=chunk;

   });
   m_timer->start();

}

void MailGun::beginConnection(const QString &host, int port, const QString &login, const QString &password)
{
//        QTcpSocket sock;
//        QNetworkProxy prox;
//        prox.setType(QNetworkProxy::Socks5Proxy);
//        QString host1 = "98.178.72.21";
//        int port1 = 10919;
//        prox.setHostName(host1);
//        prox.setPort(port1);
//        sock.setProxy(prox);
//        sock.connectToHost("www.example.com",5000);

//        if(sock.wawstartForConnected()) {
//            qDebug() << "Connected";
//        }

        this->setupConnection(host,port,login,password);
}

