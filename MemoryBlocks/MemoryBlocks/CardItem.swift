//
//  CardItem.swift
//  MemoryBlocks
//
//  Created by bulut.oztemur on 26.08.24.
//

import SwiftUI

class CardItem: Identifiable, Hashable, ObservableObject {
    init(card: Card) {
        self.card = card
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: CardItem, rhs: CardItem) -> Bool {
        rhs.id == lhs.id
    }
    
    var id: UUID = UUID()
    var card: Card
    @Published var open: Bool = false
}

enum Card: Int, CaseIterable {
    case bicycle = 0
    case bus
    case car
    case helicopter
    case motorcycle
    case plane
    case scooter
    case rv
    case rocket
    case tank
    case train
    case truck
    
    var image: Image {
        return switch self {
        case .bicycle:
            Image(.bicycle)
        case .bus:
            Image(.bus)
        case .car:
            Image(.car)
        case .helicopter:
            Image(.helicopter)
        case .motorcycle:
            Image(.motorcycle)
        case .plane:
            Image(.plane)
        case .scooter:
            Image(.scooter)
        case .rv:
            Image(.rv)
        case .rocket:
            Image(.rocket)
        case .tank:
            Image(.tank)
        case .train:
            Image(.train)
        case .truck:
            Image(.truck)
        }
    }
    
    var defaultImage: Image {
        Image(.brain)
    }
}
