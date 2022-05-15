#ifndef FILEREADER_H
#define FILEREADER_H

#include <QObject>
#include "QIODevice"

class FileReader : public QObject
{
    Q_OBJECT
public:
    explicit FileReader(QObject *parent = nullptr);
    QStringList readFile(const QString& filepath);

signals:
    QStringList emails_read(QStringList);

private:
    class QFile* m_qfile;
    bool fileExist();
    bool file_open(QIODevice::OpenMode flags);


};

#endif // FILEREADER_H
