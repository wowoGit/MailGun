#ifndef APP_H
#define APP_H

#include <QObject>

class App : public QObject
{
    Q_OBJECT
public:
    explicit App(class SmtpClient* client_info, QObject *parent = nullptr);

private:
    class FileReader* m_freader;
    class MailGun* m_mailgun;


signals:
    void process_emails(QString emails_list);

public slots:
   void file_submitted(const QString& filepath);
private slots:
   void file_read(QStringList);

};

#endif // APP_H
