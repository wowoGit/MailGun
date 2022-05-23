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
    Message& setRecipient(EmailAddress* address);
    Message& addSubject(const QString& subject);
    Message& setSender(EmailAddress* address);
    Message& addFiles(QVector<MimeFile*> files);
    Message& setMessage(MimeText* text);
    MimeMessage* build();


private:
    class MimeMessage* m_message;
};

#endif // MESSAGE_H
