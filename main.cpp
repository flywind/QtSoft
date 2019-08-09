#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QColor>
#include <QQmlContext>
#include <QQuickView>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}

//int main(int argc, char *argv[])
//{
//    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

//    QGuiApplication app(argc, argv);

//    QQuickView view;
//    //设置无边框
//    view.setFlags(Qt::FramelessWindowHint);
//    //设置背景透明
//    view.setColor(QColor(Qt::transparent));
//    view.setSource(QUrl("qrc:/main.qml"));
//    view.show();
//    //将viewer设置为main.qml属性
//    view.rootContext()->setContextProperty("mainwindow",&view);

//    return app.exec();
//}
