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
    
    var image: Image {
        return switch self {
        case .ambulance:
            Image(.ambulance)
        case .bicycle:
            Image(.bicycle)
        case .bulldozer:
            Image(.bulldozer)
        case .bus:
            Image(.bus)
        case .car:
            Image(.car)
        case .drilling:
            Image(.drilling)
        case .excavator:
            Image(.excavator)
        case .helicopter:
            Image(.helicopter)
        case .jet:
            Image(.jet)
        case .motorcycle:
            Image(.motorcycle)
        case .plane:
            Image(.plane)
        case .police:
            Image(.police)
        case .scooter:
            Image(.scooter)
        case .rv:
            Image(.rv)
        case .rocket:
            Image(.rocket)
        case .tank:
            Image(.tank)
        case .taxi:
            Image(.taxi)
        case .train:
            Image(.train)
        case .truck:
            Image(.truck)
        case .zeppelin:
            Image(.zeppelin)
        }
    }
}
