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

Message &Message::setRecipient(EmailAddress *address)
{
    this->m_message->addRecipient(address);
    return *this;
}

Message &Message::addSubject(const QString &subject)
{
    this->m_message->setSubject(subject);
    return *this;
}

Message &Message::setSender(EmailAddress *address)
{
    this->m_message->setSender(address);
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

Message &Message::setMessage(MimeText *text)
{
    this->m_message->addPart(text);
    return *this;
}

MimeMessage *Message::build()
{
   return this->m_message;
}
