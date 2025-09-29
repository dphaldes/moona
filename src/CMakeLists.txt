add_executable(moona)

ecm_add_qml_module(moona
  URI org.kde.moona
)

target_sources(moona PRIVATE
  main.cpp
  data/SolidAdapter.h
  data/SolidAdapter.cpp
)

set_source_files_properties(qml/SensorData.qml PROPERTIES QT_QML_SINGLETON_TYPE TRUE)

ecm_target_qml_sources(moona SOURCES
  qml/Main.qml
  qml/SensorData.qml
  qml/SystemPage.qml
  qml/components/IconDelegate.qml
  qml/components/SensorDelegate.qml
  qml/components/SensorLineChart.qml
  qml/WorkInProgress.qml
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
  KF6::Solid
  # KSysGuard::Sensors
  # KSysGuard::SensorFaces
)
