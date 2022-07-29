#include <QQmlContext>
#include <QThread>
#include "app.h"
#include "filereader.h"
#include "mailgun.h"
#include "message.h"

App::App(QObject *parent)
    : QObject{parent}
{
   m_freader = new FileReader();
   m_mailgun = new MailGun();
   senderThread = new QThread(this);
   readerThread = new QThread(this);
   m_freader->connect(m_freader, &FileReader::emails_read,this,&App::file_read);
   m_mailgun->moveToThread(senderThread);
   m_freader->moveToThread(readerThread);
   senderThread->start();
   readerThread->start();

   this->connect(this, &App::readyToMail,m_mailgun,&MailGun::beginMailing);
   this->connect(this, &App::readyToRead,m_freader,&FileReader::beginReading);
   this->connect(this, &App::readyToConnect,m_mailgun,&MailGun::beginConnection);
   this->connect(this, SIGNAL(destroyed()), senderThread, SLOT(quit()));
   this->connect(this, SIGNAL(destroyed()), readerThread, SLOT(quit()));
}

const QStringList &App::recipients() const
{
    return m_recipients;
}

void App::sendAll(const QString& header, const QString& body, const QString& attached_files)
{
    if(m_recipients.empty())
    {
        return;
    }
    QStringList filenames;
    filenames.append(attached_files);
    auto message = new Message();
    message->addSubject(header)
            .setMessage(body)
            .addFiles(filenames)
            .setRecipients(m_recipients);

    emit readyToMail(message);

}


App::~App()
{
}

void App::file_submitted(const QString &filepath)
{
    if(filepath.length() <= 0)
        return;
    emit readyToRead(filepath);

}

//Вынести в структуру
void App::connectToServer(const QString &host, int port, const QString &login, const QString &password)
{
    emit readyToConnect(host,port,login,password);
}


void App::file_read(QStringList emails_list)
{
    QString view_list = emails_list.join("\n");
    m_recipients.clear();
    m_recipients.append(emails_list);
    //emit process_emails(view_list);
    emit recipientsChanged();
}
