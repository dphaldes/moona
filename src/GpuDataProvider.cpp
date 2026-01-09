#include "GpuDataProvider.h"
#include <QDebug>
#include <QLoggingCategory>
#include <ksysguard/sensors/SensorQuery.h>

using namespace Qt::StringLiterals;

QList<SensorDataModel*> GpuDataProvider::gpus() { return m_gpus; }

void GpuDataProvider::getGpuSensors() {
  auto query = new KSysGuard::SensorQuery(u"gpu/gpu\\d"_s);
  query->connect(query, &KSysGuard::SensorQuery::finished, [query, this]() {
    query->deleteLater();

    initializeGpuSensors(query->sensorIds().count());
  });

  query->execute();
}

void GpuDataProvider::initializeGpuSensors(int count) {

  for (int index = 0; index < count; index++) {
    auto query =
        new KSysGuard::SensorQuery(QStringLiteral("gpu/gpu%1/.*").arg(index));
    query->connect(query, &KSysGuard::SensorQuery::finished, [query, this]() {
                     query->deleteLater();
                     auto model = new SensorDataModel(query->sensorIds()) ;
                     model -> setUpdateRateLimit(1000);
                     this->m_gpus.append(model);
                   });

    query->execute();
  }
}
