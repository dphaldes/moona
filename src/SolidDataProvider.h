#ifndef SOLID_PROVIDER_H
#define SOLID_PROVIDER_H

#include <QObject>
#include <QtQml/qqmlregistration.h>
#include <qqmlintegration.h>

class SolidDataProvider : public QObject {
  Q_OBJECT
  QML_ELEMENT
  QML_SINGLETON
  Q_PROPERTY(QString cpuName READ cpuName CONSTANT)

public:
  auto cpuName() -> QString;
};

#endif // SOLID_PROVIDER_H
