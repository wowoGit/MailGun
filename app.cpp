#include "app.h"
#include <QQmlContext>
#include "filereader.h"
#include "mailgun.h"

App::App(SmtpClient* client_info, QObject *parent)
    : QObject{parent}
{
   m_freader = new FileReader();
   m_mailgun = new MailGun(client_info);
   m_freader->connect(m_freader, &FileReader::emails_read,this,&App::file_read);
}

const QStringList &App::recipients() const
{
    return m_recipients;
}

void App::sendAll()
{
    if(m_recipients.empty())
    {
        return;
    }
    MailGun::MailInfo info;
    for(const auto& address : m_recipients) {
        m_mailgun->sendMessage()
    }

}


App::~App()
{
    delete m_freader;
    delete m_mailgun;
}

void App::file_submitted(const QString &filepath)
{
    if(filepath.length() <= 0)
        return;

    m_freader->readFile(filepath);
}

void App::file_read(QStringList emails_list)
{
    QString view_list = emails_list.join("\n");
    m_recipients.clear();
    m_recipients.append(emails_list);
    //emit process_emails(view_list);
    emit recipientsChanged();
}
