#include "oscsender.h"


OscSender::OscSender(QString server, int port, QObject *parent) : QObject(parent)
{
	m_client = NULL;
	setNewTarget(server, port);
}

void OscSender::setNewTarget(QString address, int port)
{
	if (m_client) {
		delete(m_client);
	}
	m_client = new QOscClient(QHostAddress(address), port, NULL);
	if (m_client) {
		qDebug()<<"Sending messages to: " << address << ",port " << port;
		m_client->sendData("/test","hello");
	}
}

void OscSender::sendHeartRate(int hr)
{
	if (m_client) {
		//qDebug()<<"Sending heartrate " << hr;
		m_client->sendData("/heart",hr);
	}
}



