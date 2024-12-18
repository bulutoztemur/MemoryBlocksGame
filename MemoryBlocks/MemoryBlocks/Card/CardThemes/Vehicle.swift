//
//  Vehicle.swift
//  MemoryBlocks
//
//  Created by bulut.oztemur on 15.12.24.
//

import SwiftUI

enum Vehicle: Int, CaseIterable, Card {
    case ambulance = 0
    case bicycle
    case bulldozer
    case bus
    case car
    case drilling
    case excavator
    case helicopter
    case jet
    case motorcycle
    case plane
    case police
    case scooter
    case rv
    case rocket
    case tank
    case taxi
    case train
    case truck
    case zeppelin   
    
    static var defaultCard: Vehicle = .ambulance
    static var themeImage: Image = Image(.airplane)        
    static var themeTitle: LocalizedStringKey = LocalizedStringKey("Vehicles")
}
