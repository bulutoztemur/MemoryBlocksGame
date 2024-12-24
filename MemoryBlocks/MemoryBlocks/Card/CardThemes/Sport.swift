//
//  Sport.swift
//  MemoryBlocks
//
//  Created by bulut.oztemur on 24.12.24.
//

import SwiftUI

enum Sport: Int, CaseIterable, Card {
    case archery
    case athletism
    case baseball
    case basketball
    case billiard
    case bowling
    case boxing
    case fencing
    case gymnastics
    case highjump
    case icehockey
    case judo
    case kayak
    case pingpong
    case polevault
    case rugby
    case running
    case soccer
    case swimming
    case tennis
    case volleyball
    case weightlifting
    case workout

    static var defaultCard: Sport = .soccer
    static var themeImage: Image = Image(.sports)
    static var themeTitle: LocalizedStringKey = LocalizedStringKey("Sports")
}


