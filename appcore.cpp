#include "appcore.h"

AppCore::AppCore(QObject *parent) : QObject(parent) {

    dimenshion = 3;
    rndVector = {1,2,3,4,5,6,7,8,-1};
    fillMatrix(dimenshion);
}

void AppCore::checkField() {

    bool res = true;
    for(int i = 0; i < rndVector.size() - 2; i++) {
        if(rndVector[i] > rndVector[i + 1]) {
            res = false;
            break;
        }
    }
    if(res)
        emit showWinWindow();
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

// void AppCore::upPressed()
// {
//     // if nullCell in last row, then break
//     if(rndVector.indexOf(-1) < dimenshion * (dimenshion - 1)) {
//         swapWithNull(rndVector.indexOf(-1) + dimenshion);
//         //emit printMatrix(rndVector, dimenshion);
//     }
// }
//
// void AppCore::downPressed()
// {
//     // if nullCell in first row, then break
//     if(rndVector.indexOf(-1) >= dimenshion) {
//         swapWithNull(rndVector.indexOf(-1) - dimenshion);
//         //emit printMatrix(rndVector, dimenshion);
//     }
// }
//
// void AppCore::rightPressed()
// {
//     // if nullCell in left column, then break
//     if(rndVector.indexOf(-1) % dimenshion != 0) {
//         swapWithNull(rndVector.indexOf(-1) - 1);
//         //emit printMatrix(rndVector, dimenshion);
//     }
// }
//
// void AppCore::leftPressed()
// {
//     // if nullCell in right column, then break
//     if((rndVector.indexOf(-1) + 1) % dimenshion != 0) {
//         swapWithNull(rndVector.indexOf(-1) + 1);
//         //emit printMatrix(rndVector, dimenshion);
//     }
// }
//
// void AppCore::clickOn(int idx)
// {
//     if(isNeighbourNullCell(idx)) {
//         qDebug() << "add move animation";
//         swapWithNull(idx);
//         //emit printMatrix(rndVector, dimenshion);
//     } else {
//         qDebug() << "add gradient animation from red to green";
//     }
// }
