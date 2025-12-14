#include "SolidDataProvider.h"
#include <QObject>
#include <Solid/Device>
#include <Solid/DeviceNotifier>
#include <Solid/Processor>

auto SolidDataProvider::cpuName() -> QString {
  return Solid::Device::listFromType(Solid::DeviceInterface::Processor).at(0).product();
}
