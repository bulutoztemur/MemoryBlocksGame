//
//  CardThemeManager.swift
//  MemoryBlocks
//
//  Created by bulut.oztemur on 15.12.24.
//

import Foundation

class CardManager {
    enum CardThemes {
        case vehicle
        case flag
    }

    static let shared = CardManager()
    
    var type: CardThemes = .flag
    
    func getCard(rawValue: Int) -> Card {
        switch type {
        case .flag:
            return Flag(rawValue: rawValue) ?? .azerbeijan
        case .vehicle:
            return Vehicle(rawValue: rawValue) ?? .bicycle
        }
    }
        
    private init() {}
}
