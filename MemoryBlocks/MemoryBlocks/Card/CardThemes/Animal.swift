//
//  Animal.swift
//  MemoryBlocks
//
//  Created by bulut.oztemur on 24.12.24.
//

import SwiftUI

enum Animal: Int, CaseIterable, Card {
    case alligator
    case bear
    case bunny
    case cat
    case chicken
    case cow
    case deer
    case dog
    case eagle
    case giraffe
    case gorilla
    case hipo
    case horse
    case jellyfish
    case lion
    case monkey
    case mouse
    case polarbear
    case shark
    case sheep
    case snake
    case tiger
    case wolf
    case zebra
    
    static var defaultCard: Animal = .lion
    static var themeImage: Image = Image(.lionicon)
    static var themeTitle: LocalizedStringKey = LocalizedStringKey("Animals")
    
    var padding: EdgeInsets { EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0) }
}


