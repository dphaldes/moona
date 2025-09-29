#ifndef SOLID_ADAPTER_H
#define SOLID_ADAPTER_H

#include <QObject>
#include <QtQml/qqmlregistration.h>
#include <qqmlintegration.h>

class SolidAdapter : public QObject {
  Q_OBJECT
  QML_ELEMENT
  QML_SINGLETON
  Q_PROPERTY(QString cpuName READ getCpuName)

public:
  explicit SolidAdapter(QObject *parent = nullptr);

private:
  auto getCpuName() -> QString;
};

#endif // SOLID_ADAPTER_H
