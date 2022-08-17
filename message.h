#ifndef MESSAGE_H
#define MESSAGE_H
#include <QString>

class MimePart;
class MimeMessage;
class MimeText;
class MimeFile;
class EmailAddress;

class Message
{
public:
    Message();
    ~Message();
    Message& setRecipients(const QStringList& address);
    Message& addSubject(const QString& subject);
    Message& setSender(const QString& address);
    Message& addFiles(const QStringList& files);
    Message& setMessage(const QString& text);
    const QStringList& getRecipients() const;
    const QString& getSubject() const;
    QList<MimePart*>& getContent() const;
    const EmailAddress& getSender(const QString& text);
    MimeMessage* build();


private:
    class MimeMessage* m_message;
    const QStringList* list_ref = nullptr;
};

#endif // MESSAGE_H
