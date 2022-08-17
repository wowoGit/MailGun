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

Message &Message::setRecipients(const QStringList& addresses)
{
    list_ref = &addresses;
    for (auto&& addr : addresses){
    EmailAddress* address =  new EmailAddress(addr);
    address->setParent(m_message);
    this->m_message->addRecipient(address);
    }
    return *this;
}

const QStringList& Message::getRecipients() const
{
    return *list_ref;
}

Message &Message::addSubject(const QString &subject)
{
    this->m_message->setSubject(subject);
    return *this;
}

Message &Message::setSender(const QString& address)
{
    EmailAddress* addr = new EmailAddress(address);
    addr->setParent(m_message);
    this->m_message->setSender(addr);
    return *this;
}

Message &Message::addFiles(const QStringList& files)
{
   for (auto&& file : files)
   {
       QFile* qfile = new QFile(file);
       MimeFile* mimefile = new MimeFile(qfile);
       mimefile->setParent(m_message);
       this->m_message->addPart(mimefile);
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
