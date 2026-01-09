#ifndef GPU_DATA_PROVIDER_H
#define GPU_DATA_PROVIDER_H

#include <QObject>
#include <QtQml/qqmlregistration.h>
#include <qqmlintegration.h>
#include <QList>
#include <ksysguard/sensors/SensorDataModel.h>

using SensorDataModel = KSysGuard::SensorDataModel;

class GpuDataProvider : public QObject {
  Q_OBJECT
  QML_ELEMENT
  QML_SINGLETON
  Q_PROPERTY(QList<SensorDataModel*> gpus READ gpus NOTIFY gpusChanged)
    

public:
  GpuDataProvider(QObject *parent = nullptr) : QObject(parent) {
      getGpuSensors();
  }

  void getGpuSensors();
  void initializeGpuSensors(int count);
  QList<SensorDataModel*> gpus();
  Q_SIGNAL void gpusChanged();

private:
QList<SensorDataModel*> m_gpus;

};

#endif // GPU_DATA_PROVIDER_H
