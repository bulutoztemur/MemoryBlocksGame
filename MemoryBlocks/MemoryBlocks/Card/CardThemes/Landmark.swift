//
//  Landmark.swift
//  MemoryBlocks
//
//  Created by bulut.oztemur on 16.12.24.
//

import SwiftUI

enum Landmark: Int, CaseIterable, Card {
    case acropolis
    case bavyera
    case bigben
    case bosphorus
    case burj
    case canyon
    case chichen
    case christ
    case colesseum
    case eiffel
    case faces
    case forbidden
    case fuji
    case giza
    case hagia
    case liberty
    case louvre
    case niagara
    case petra
    case sangra
    case stone
    case tacmahal
    case times
    case vatican
    case wall
    
    static var defaultCard: Landmark = .eiffel
    static var themeImage: Image = Image(.eiffeltower)
    static var themeTitle: LocalizedStringKey = LocalizedStringKey("Landmarks")
    
    var padding: CGFloat { 0.0 }
}
