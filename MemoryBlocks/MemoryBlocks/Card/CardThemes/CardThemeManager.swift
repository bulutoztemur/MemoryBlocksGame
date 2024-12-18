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
    
    func getCard(rawValue: Int) -> Card {
        switch theme {
        case .flag:
            return Flag(rawValue: rawValue) ?? .azerbeijan
        case .vehicle:
            return Vehicle(rawValue: rawValue) ?? .bicycle
        case .deck:
            return Deck(rawValue: rawValue) ?? .deck_red_joker
        case .landmark:
            return Landmarks(rawValue: rawValue) ?? .bosphorus
        }
    }
    
    func getThemeImage(cardType: CardTheme) -> Image {
        switch cardType {
        case .flag:
            return Image(.world)
        case .vehicle:
            return Image(.airplane)
        case .deck:
            return Image(.poker)
        case .landmark:
            return Image(.eiffeltower)
        }
    }
    
    func getTotalPossibleDistintCard() -> Int {
        switch theme {
        case .vehicle:
            Vehicle.allCases.count
        case .flag:
            Flag.allCases.count
        case .deck:
            Deck.allCases.count
        case .landmark:
            Landmarks.allCases.count
        }
    }
}

enum CardTheme: String, CaseIterable, Codable {
    case vehicle
    case flag
    case deck
    case landmark

    var localizedTitle: LocalizedStringKey { LocalizedStringKey(title) }
    
    var title: String {
        switch self {
        case .vehicle:
            return "Vehicles"
        case .flag:
            return "Flags"
        case .deck:
            return "Deck"
        case .landmark:
            return "Landmarks"
        }
    }
}
