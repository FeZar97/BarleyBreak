#ifndef APPCORE_H
#define APPCORE_H

#include <QObject>
#include <QRandomGenerator>

#include <QDebug>

class AppCore : public QObject
{
    Q_OBJECT

private:
    int dimenshion;
    Q_INVOKABLE QVector<int> rndVector;
    bool isComplete;

public:
    explicit AppCore(QObject *parent = nullptr);

    bool checkOrder();

signals:
    void printMatrix(QVector<int> rndVec, int dim);

public slots:
    void fillMatrix(int _dimenshion);
};

#endif // APPCORE_H
