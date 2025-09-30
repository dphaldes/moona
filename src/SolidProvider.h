#ifndef SOLID_PROVIDER_H
#define SOLID_PROVIDER_H

#include <QObject>
#include <QtQml/qqmlregistration.h>
#include <qqmlintegration.h>

class SolidProvider : public QObject {
  Q_OBJECT
  QML_ELEMENT
  QML_SINGLETON
  Q_PROPERTY(QString cpuName READ cpuName)

public:
  auto cpuName() -> QString;
};

#endif // SOLID_PROVIDER_H
