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

void App::file_submitted(const QString &filepath)
{
    if(filepath.length() <= 0)
        return;

    m_freader->readFile(filepath);
}

void App::file_read(QStringList emails_list)
{
    QString view_list = emails_list.join("\n");
    emit process_emails(view_list);
}
