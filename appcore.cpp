#include "appcore.h"

AppCore::AppCore(QObject *parent) : QObject(parent) {

    dimenshion = 4;
}

void AppCore::swapWithNull(int idxOfNeighbour) {

    QPair<int, int> neighbourCell(idxOfNeighbour, rndVector[idxOfNeighbour]);
    QPair<int, int> nullCell(rndVector.indexOf(-1), rndVector[rndVector.indexOf(-1)]);

    rndVector[neighbourCell.first] = -1;
    rndVector[nullCell.first] = neighbourCell.second;
}

bool AppCore::isNeighbourNullCell(int cellIdx)
{
    return (
           (( (cellIdx    ) % dimenshion > 0 )        ? ( rndVector[cellIdx - 1] == -1 )          : false)// left side
            or
           (( (cellIdx + 1) % dimenshion > 0 )        ? ( rndVector[cellIdx + 1] == -1 )          : false) // right side
            or
           ((cellIdx >= dimenshion)                    ? ( rndVector[cellIdx - dimenshion] == -1 ) : false) // top side
            or
           ((cellIdx < dimenshion * (dimenshion - 1)) ? ( rndVector[cellIdx + dimenshion] == -1 ) : false) // bot side
           );
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

void AppCore::upPressed()
{
    // if nullCell in last row, then break
    if(rndVector.indexOf(-1) < dimenshion * (dimenshion - 1)) {
        swapWithNull(rndVector.indexOf(-1) + dimenshion);
        emit printMatrix(rndVector, dimenshion);
    }
}

void AppCore::downPressed()
{
    // if nullCell in first row, then break
    if(rndVector.indexOf(-1) >= dimenshion) {
        swapWithNull(rndVector.indexOf(-1) - dimenshion);
        emit printMatrix(rndVector, dimenshion);
    }
}

void AppCore::rightPressed()
{
    // if nullCell in left column, then break
    if(rndVector.indexOf(-1) % dimenshion != 0) {
        swapWithNull(rndVector.indexOf(-1) - 1);
        emit printMatrix(rndVector, dimenshion);
    }
}

void AppCore::leftPressed()
{
    // if nullCell in right column, then break
    if((rndVector.indexOf(-1) + 1) % dimenshion != 0) {
        swapWithNull(rndVector.indexOf(-1) + 1);
        emit printMatrix(rndVector, dimenshion);
    }
}

void AppCore::clickOn(int idx)
{
    if(isNeighbourNullCell(idx)) {
        qDebug() << "cell " << rndVector[idx] << " is movable";
        swapWithNull(idx);
        emit printMatrix(rndVector, dimenshion);
    } else {
        qDebug() << "cell " << rndVector[idx] << " hasn't neighbour -1";
    }
}
