#include <KIconTheme>
#include <KLocalizedContext>
#include <KLocalizedString>
#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QtQml>

int main(int argc, char *argv[]) {
  KIconTheme::initTheme();
  QApplication app(argc, argv);
  KLocalizedString::setApplicationDomain("org.kde.moona");
  QApplication::setApplicationName(QStringLiteral("Moona"));
  QApplication::setOrganizationName(QStringLiteral("KDE"));

  if (qEnvironmentVariableIsEmpty("QT_QUICK_CONTROLS_STYLE")) {
    QQuickStyle::setStyle(QStringLiteral("org.kde.desktop"));
  }

  QQmlApplicationEngine engine;
  engine.rootContext()->setContextObject(new KLocalizedContext(&engine));
  engine.loadFromModule("org.kde.Moona", "Main");

  return app.exec();
}
