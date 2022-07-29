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
    MimeMessage* build();


private:
    class MimeMessage* m_message;
};

#endif // MESSAGE_H
