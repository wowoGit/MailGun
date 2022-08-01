#include "filereader.h"
#include <QFile>
#include <QException>
#include <QDebug>

FileReader::FileReader(QObject *parent)
    : QObject{parent}
{
}

QStringList FileReader::readFile(const QString &filepath)
{
    if (!m_qfile)
    {
        delete m_qfile;
        m_qfile = new QFile(filepath,this);
    }

    if (!this->fileExist()) {
       return QStringList();
    }

    if(!this->file_open(QIODevice::ReadOnly | QIODevice::Text)) {
        return QStringList();
    }


    QTextStream stream(this->m_qfile);
    stream.setCodec("UTF-8");

    QString blob_content = stream.readAll();
    QStringList split_content = blob_content.split("\n");
    m_qfile->close();
    qDebug() << this;
    emit emails_read(split_content);
    return split_content;

}

void FileReader::beginReading(const QString &filepath)
{
    this->readFile(filepath);
}

bool FileReader::fileExist()
{
    if(!m_qfile->exists())
    {
        qDebug() << "file doesnt exist";
        delete m_qfile;
        return false;
    }

    return true;
}

bool FileReader::file_open(QIODevice::OpenMode flags)
{
    if (!m_qfile->open(flags))
    {
        qDebug() << " could not be opened!";
        return false;
    }
    return true;
}
