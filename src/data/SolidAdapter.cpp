#include "SolidAdapter.h"
#include <QObject>

#include <Solid/Device>
#include <Solid/DeviceNotifier>
#include <Solid/Processor>

SolidAdapter::SolidAdapter(QObject *parent) : QObject(parent) {}

auto SolidAdapter::getCpuName() -> QString {
  const auto devices =
      Solid::Device::listFromType(Solid::DeviceInterface::Processor);

  return devices[0].product();
}
