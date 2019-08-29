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

    void swapWithNull(int neighbourIdx);
    bool isNeighbourNullCell(int cellIdx);

public:
    explicit AppCore(QObject *parent = nullptr);

    bool checkOrder();

signals:
    void printMatrix(QVector<int> rndVec, int dim);

public slots:
    void fillMatrix(int _dimenshion);

    void upPressed();
    void downPressed();
    void rightPressed();
    void leftPressed();

    void clickOn(int idx);
};

#endif // APPCORE_H
