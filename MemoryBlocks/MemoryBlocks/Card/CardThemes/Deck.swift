//
//  Deck.swift
//  MemoryBlocks
//
//  Created by bulut.oztemur on 16.12.24.
//

import SwiftUI

enum Deck: Int, CaseIterable, Card {
    case deck_10_of_clubs = 0
    case deck_10_of_diamonds
    case deck_10_of_hearts
    case deck_10_of_spades
    case deck_2_of_clubs
    case deck_2_of_diamonds
    case deck_2_of_hearts
    case deck_2_of_spades
    case deck_3_of_clubs
    case deck_3_of_diamonds
    case deck_3_of_hearts
    case deck_3_of_spades
    case deck_4_of_clubs
    case deck_4_of_diamonds
    case deck_4_of_hearts
    case deck_4_of_spades
    case deck_5_of_clubs
    case deck_5_of_diamonds
    case deck_5_of_hearts
    case deck_5_of_spades
    case deck_6_of_clubs
    case deck_6_of_diamonds
    case deck_6_of_hearts
    case deck_6_of_spades
    case deck_7_of_clubs
    case deck_7_of_diamonds
    case deck_7_of_hearts
    case deck_7_of_spades
    case deck_8_of_clubs
    case deck_8_of_diamonds
    case deck_8_of_hearts
    case deck_8_of_spades
    case deck_9_of_clubs
    case deck_9_of_diamonds
    case deck_9_of_hearts
    case deck_9_of_spades
    case deck_ace_of_clubs
    case deck_ace_of_diamonds
    case deck_ace_of_hearts
    case deck_ace_of_spades
    case deck_ace_of_spades2
    case deck_black_joker
    case deck_jack_of_clubs2
    case deck_jack_of_diamonds2
    case deck_jack_of_hearts2
    case deck_jack_of_spades2
    case deck_king_of_clubs2
    case deck_king_of_diamonds2
    case deck_king_of_hearts2
    case deck_king_of_spades2
    case deck_queen_of_clubs2
    case deck_queen_of_diamonds2
    case deck_queen_of_hearts2
    case deck_queen_of_spades2
    case deck_red_joker    
    
    static var defaultCard: Deck = .deck_red_joker
    static var themeImage: Image = Image(.poker)
    static var themeTitle: LocalizedStringKey = LocalizedStringKey("Deck")
    
    var padding: EdgeInsets { EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8) }
}
