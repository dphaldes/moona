#include "SolidProvider.h"
#include <QObject>
#include <Solid/Device>
#include <Solid/DeviceNotifier>
#include <Solid/Processor>

auto SolidProvider::cpuName() -> QString {
  const auto devices =
      Solid::Device::listFromType(Solid::DeviceInterface::Processor);

  return devices[0].product();
}
