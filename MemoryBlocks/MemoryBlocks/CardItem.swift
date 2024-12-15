//
//  CardItem.swift
//  MemoryBlocks
//
//  Created by bulut.oztemur on 26.08.24.
//

import SwiftUI

class CardItem: Identifiable, Hashable {
    var id: UUID = UUID()
    var card: Card.Vehicle
        
    init(card: Card.Vehicle) {
        self.card = card
    }

    static func == (lhs: CardItem, rhs: CardItem) -> Bool {
        rhs.id == lhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

enum Card {
    enum Vehicle: Int, CaseIterable {
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
        
        var defaultImage: Image {
            Image(.brain)
        }
    }
    
    enum Flag {
        case azerbeijan
        case bosnia
        case brazil
        case canada
        case china
        case czech
        case egypt
        case france
        case germany
        case india
        case italy
        case japan
        case mexico
        case pakistan
        case southafrica
        case southkorea
        case spain
        case sweden
        case switzerland
        case turkey
        case uk
        case us
        
        
        var image: Image {
            switch self {
            case .azerbeijan:
                return Image(.azerbeijan)
            case .bosnia:
                return Image(.bosnia)
            case .brazil:
                return Image(.brazil)
            case .canada:
                return Image(.canada)
            case .china:
                return Image(.china)
            case .czech:
                return Image(.czech)
            case .egypt:
                return Image(.egypt)
            case .france:
                return Image(.france)
            case .germany:
                return Image(.germany)
            case .india:
                return Image(.india)
            case .italy:
                return Image(.italy)
            case .japan:
                return Image(.japan)
            case .mexico:
                return Image(.mexico)
            case .pakistan:
                return Image(.pakistan)
            case .southafrica:
                return Image(.southafrica)
            case .southkorea:
                return Image(.southkorea)
            case .spain:
                return Image(.spain)
            case .sweden:
                return Image(.sweden)
            case .switzerland:
                return Image(.switzerland)
            case .turkey:
                return Image(.turkey)
            case .uk:
                return Image(.uk)
            case .us:
                return Image(.us)
            }
        }
    }
}
