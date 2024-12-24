//
//  CardThemeManager.swift
//  MemoryBlocks
//
//  Created by bulut.oztemur on 15.12.24.
//

import SwiftUI

class CardThemeManager {
    static let shared = CardThemeManager()
    
    var theme: CardTheme {
        didSet {
            guard oldValue != self.theme else { return }
            if let encoded = try? JSONEncoder().encode(self.theme) {
                UserDefaults.standard.set(encoded, forKey: "themeType")
            }
        }
    }
        
    private init() {
        if let data = UserDefaults.standard.object(forKey: "themeType") as? Data,
           let theme = try? JSONDecoder().decode(CardTheme.self, from: data) {
            self.theme = theme
        } else {
            self.theme = CardTheme.vehicle
        }
    }
}

enum CardTheme: CaseIterable, Codable {
    case vehicle
    case flag
    case deck
    case landmark
    case sport
    case animal
    
    var cardType: Card.Type {
        switch self {
        case .vehicle:
            return Vehicle.self
        case .flag:
            return Flag.self
        case .deck:
            return Deck.self
        case .landmark:
            return Landmark.self
        case .sport:
            return Sport.self
        case .animal:
            return Animal.self
        }
    }
}


