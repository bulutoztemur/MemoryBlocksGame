//
//  CardItem.swift
//  MemoryBlocks
//
//  Created by bulut.oztemur on 26.08.24.
//

import SwiftUI

class CardItem: Identifiable, Hashable {
    var id: UUID = UUID()
    var card: Card
    
    init(card: Card) {
        self.card = card
    }
    
    static func == (lhs: CardItem, rhs: CardItem) -> Bool {
        rhs.id == lhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
