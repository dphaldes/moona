add_executable(moona)

target_sources(moona PRIVATE
  main.cpp
)

ecm_add_qml_module(moona URI org.kde.Moona)

ecm_target_qml_sources(moona SOURCES
  qml/Main.qml
  qml/SystemPage.qml
  qml/SomePage.qml
  qml/components/IconDelegate.qml
  qml/components/SensorLineChart.qml
)

target_link_libraries(moona PRIVATE
  Qt6::Quick
  Qt6::Qml
  Qt6::Gui
  Qt6::QuickControls2
  Qt6::Widgets
  KF6::I18n
  KF6::CoreAddons
  KF6::IconThemes
  KSysGuard::Sensors
  KSysGuard::SensorFaces
)
