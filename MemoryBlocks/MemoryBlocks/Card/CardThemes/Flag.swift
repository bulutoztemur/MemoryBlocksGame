//
//  Flag.swift
//  MemoryBlocks
//
//  Created by bulut.oztemur on 15.12.24.
//

import SwiftUI

enum Flag: Int, CaseIterable, Card {
    case azerbeijan = 0
    case bosnia
    case brazil
    case canada
    case china
    case czech
    case egypt
    case france
    case germany
    case india
    case iran
    case italy
    case japan
    case mexico
    case pakistan
    case russia
    case southafrica
    case spain
    case sweden
    case switzerland
    case turkey
    case uk
    case us 
    
    static var defaultCard: Flag = .turkey
    static var themeImage: Image = Image(.world)
    static var themeTitle: LocalizedStringKey = LocalizedStringKey("Flags")
}
