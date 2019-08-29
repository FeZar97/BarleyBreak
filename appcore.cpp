#include "appcore.h"

AppCore::AppCore(QObject *parent) : QObject(parent)
{
    dimenshion = 4;
}

void AppCore::fillMatrix(int _dimenshion) {

    dimenshion = _dimenshion;

    rndVector.clear();
    int newVal;

    while(rndVector.size() < dimenshion * dimenshion - 1) {
        newVal = static_cast<int>(QRandomGenerator::global()->bounded(1, dimenshion * dimenshion));
        if(!rndVector.count(newVal)) {
            rndVector.push_back(newVal);
        }
    }
    rndVector.push_back(-1);

    emit printMatrix(rndVector, dimenshion);
}
