//
//  main.swift
//  GB_swift_basics_l4
//
//  Created by Victor Lipov on 08.06.2021.
//

import Foundation

//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.

class AnyCar {
    let model: String
    let year: Int
    let trunkSizeTotal: Int
    var engineRunning: Bool
    var windowsOpen: Bool
    
    init(model: String, year: Int, trunkSizeTotal: Int, engineRunning: Bool, windowsOpen: Bool) {
        self.model = model
        self.year = year
        self.trunkSizeTotal = trunkSizeTotal
        self.engineRunning = engineRunning
        self.windowsOpen = windowsOpen

        
        AnyCar.carCount += 1
    }
    
    static var carCount = 0
    
    static func carCountInfo() {
        print("Выпущено автомобилей \(AnyCar.carCount)")
    }
    
    func doWithCar(){
    }
    
    deinit {
        print{"Автомобиль будет удален"}
    }
}


//2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.


class sportCar: AnyCar {
    var tyreType: String
    init(model: String, year: Int, trunkSizeTotal: Int, engineRunning: Bool, windowsOpen: Bool, tyreType: String) {
        self.tyreType = tyreType
        
        super.init(model: model, year: year, trunkSizeTotal: trunkSizeTotal, engineRunning: engineRunning, windowsOpen: windowsOpen)
    }

    enum SportCarActions: String {
        case slickTyre = "Установлены слики"
        case rainTyre = "Установлена дождевая резина"
    }

    func doWithCar(_ mode: SportCarActions) {
        print(mode.rawValue)
        switch mode {
        case .slickTyre:
            self.tyreType = "Slick Tyres"
        case .rainTyre:
            self.tyreType = "Rain Tires"
        }
    }
}


class trunkCar: AnyCar {
    var hasTrailer: Bool
    init(model: String, year: Int, trunkSizeTotal: Int, engineRunning: Bool, windowsOpen: Bool, hasTrailer: Bool) {
        self.hasTrailer = hasTrailer
        
        super.init(model: model, year: year, trunkSizeTotal: trunkSizeTotal, engineRunning: engineRunning, windowsOpen: windowsOpen)
    }

    enum TrunkCarActions: String {
        case attachTrailed = "Прицеп присоединен"
        case detouchTrailer = "Прицеп отсоединен"
    }

    func doWithCar(_ mode: TrunkCarActions) {
        print(mode.rawValue)
        switch mode {
        case .attachTrailed:
            self.hasTrailer = true
        case .detouchTrailer:
            self.hasTrailer = false
        }

    }
}


//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.

var mySportCar = sportCar(model: "BMW", year: 2000, trunkSizeTotal: 10, engineRunning: false, windowsOpen: false, tyreType: "Slick Tyres")

var myTrunkCar = trunkCar(model: "Peterbilt", year: 2010, trunkSizeTotal: 20000, engineRunning: false, windowsOpen: false, hasTrailer: false)


print("Установлены шины \(mySportCar.tyreType)")
mySportCar.doWithCar(.rainTyre)
print("Установлены шины \(mySportCar.tyreType)")


myTrunkCar.doWithCar(.attachTrailed)
print("Прицеп присоединен? \(myTrunkCar.hasTrailer)")
myTrunkCar.doWithCar(.detouchTrailer)
print("Прицеп присоединен? \(myTrunkCar.hasTrailer)")
