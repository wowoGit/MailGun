#include "mailgun.h"
#include "SmtpMime"

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

bool MailGun::sendMessage(const MailInfo& mail_info)
{
   MimeMessage message;
   message.setSender(new EmailAddress(m_client->getUser(), mail_info.sender_name));
   message.addRecipient(new EmailAddress(mail_info.recipient_address));

   MimeText txt;
   txt.setText(mail_info.message);
   message.addPart(&txt);

   for (auto&& file : mail_info.attached_files)
   {
        MimeFile mail_file(file);
        message.addPart(&mail_file);
   }


   if (m_client->sendMail(message))
       return true;


   return false;
}

MailGun::~MailGun()
{
    m_client->quit();
}
