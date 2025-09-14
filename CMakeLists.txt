cmake_minimum_required(VERSION 3.25)
project(moona)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(QT_MIN_VERSION 6.8)
set(KF_MIN_VERSION 6.10)

find_package(ECM ${KF_MIN_VERSION} REQUIRED NO_MODULE)
list(APPEND CMAKE_MODULE_PATH ${ECM_MODULE_PATH})

include(KDEInstallDirs)
include(KDECMakeSettings)
include(KDECompilerSettings NO_POLICY_SCOPE)
# include(KDEGitCommitHooks)
# include(KDEClangFormat)
include(ECMFindQmlModule)
include(ECMQmlModule)

find_package(Qt6 ${QT_MIN_VERSION} REQUIRED COMPONENTS
    Core
    Gui
    Quick
    QuickControls2
    Test
    Widgets
)

find_package(KF6 REQUIRED COMPONENTS
    Kirigami
    I18n
    CoreAddons
    QQC2DesktopStyle
    IconThemes
)

find_package(KSysGuard 6.4)
set_package_properties(KSysGuard PROPERTIES
    TYPE REQUIRED
    DESCRIPTION "The libksysguard collection of libraries"
    URL https://invent.kde.org/plasma/libksysguard
)


add_subdirectory(src)
