//
//  CardThemeManager.swift
//  MemoryBlocks
//
//  Created by bulut.oztemur on 15.12.24.
//

import SwiftUI

class CardThemeManager {
    static let shared = CardThemeManager()
            
    var theme: CardThemes {
        didSet {
            guard oldValue != self.theme else { return }
            if let encoded = try? JSONEncoder().encode(self.theme) {
                UserDefaults.standard.set(encoded, forKey: "themeType")
            }
        }
    }
    
    private init() {
        if let data = UserDefaults.standard.object(forKey: "themeType") as? Data,
           let theme = try? JSONDecoder().decode(CardThemes.self, from: data) {
            self.theme = theme
        } else {
            self.theme = CardThemes.vehicle
        }
    }
    
    func getCard(rawValue: Int) -> Card {
        switch theme {
        case .flag:
            return Flag(rawValue: rawValue) ?? .azerbeijan
        case .vehicle:
            return Vehicle(rawValue: rawValue) ?? .bicycle
        }
    }
    
    func getThemeImage(cardType: CardThemes) -> Image {
        switch cardType {
        case .flag:
            return Image(.world)
        case .vehicle:
            return Image(.airplane)
        }
    }
}

enum CardThemes: String, CaseIterable, Codable {
    case vehicle
    case flag
    
    var title: String {
        switch self {
        case .vehicle:
            return "Vehicles"
        case .flag:
            return "Flags"
        }
    }
}
