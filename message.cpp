#include "message.h"
#include "SmtpMime"

Message::Message()
{
    m_message = new MimeMessage();

}

Message::~Message()
{
   delete m_message;
}

Message &Message::setRecipient(const QString& address)
{
    EmailAddress* addr = new EmailAddress(address);
    this->m_message->addRecipient(addr);
    return *this;
}

Message &Message::addSubject(const QString &subject)
{
    this->m_message->setSubject(subject);
    return *this;
}

Message &Message::setSender(const QString& address)
{
    EmailAddress* addr = new EmailAddress(address);
    this->m_message->setSender(addr);
    return *this;
}

Message &Message::addFiles(QVector<MimeFile*> files)
{
   for (auto&& file : files)
   {
        this->m_message->addPart(file);
   }
   return *this;
}

Message &Message::setMessage(const QString& text)
{
    MimeText* mtext = new MimeText(text);
    this->m_message->addPart(mtext);
    return *this;
}

MimeMessage *Message::build()
{
   return this->m_message;
}
