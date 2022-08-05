#ifndef STATUS_H
#define STATUS_H
#include <QObject>

    class Status {
        Q_GADGET
    public:
        explicit Status();
    enum ServerResponse {
      SEND_SUCCESS,
      SEND_ERROR
    };
    enum ConnectionResult {
      CONNECTION_SUCCESS,
      CONNECTION_FAIL,
      LOGIN_FAIL
    };
    Q_ENUM(ConnectionResult)
    Q_ENUM(ServerResponse)
    };
#endif // STATUS_H
