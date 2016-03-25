#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "heartrate.h"
#include "oscsender.h"

int main(int argc, char *argv[])
{
	QGuiApplication app(argc, argv);

	QQmlApplicationEngine engine;

	HeartRate heartRate;
	engine.rootContext()->setContextProperty("heartRate", &heartRate);

	OscSender oscSender("192.168.1.220",9099);
	engine.rootContext()->setContextProperty("osc", &oscSender);

	engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

	return app.exec();
}

