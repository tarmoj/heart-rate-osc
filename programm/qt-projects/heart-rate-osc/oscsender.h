#ifndef OSCSENDER_H
#define OSCSENDER_H

#include "qosc/qoscclient.h"


class OscSender : public QObject
{
	Q_OBJECT
public:
	explicit OscSender(QString server, int port,  QObject *parent = 0);
	Q_INVOKABLE void setNewTarget(QString address, int port);
	Q_INVOKABLE void sendHeartRate(int hr);

signals:

public slots:


private:
	QOscClient * m_client;

};

#endif // OSCSENDER_H
