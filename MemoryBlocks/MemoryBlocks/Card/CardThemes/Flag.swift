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
    case southafrica
    case spain
    case sweden
    case switzerland
    case turkey
    case uk
    case us
    
    var image: Image {
        switch self {
        case .azerbeijan:
            return Image(.azerbeijan)
        case .bosnia:
            return Image(.bosnia)
        case .brazil:
            return Image(.brazil)
        case .canada:
            return Image(.canada)
        case .china:
            return Image(.china)
        case .czech:
            return Image(.czech)
        case .egypt:
            return Image(.egypt)
        case .france:
            return Image(.france)
        case .germany:
            return Image(.germany)
        case .india:
            return Image(.india)
        case .iran:
            return Image(.iran)
        case .italy:
            return Image(.italy)
        case .japan:
            return Image(.japan)
        case .mexico:
            return Image(.mexico)
        case .pakistan:
            return Image(.pakistan)
        case .southafrica:
            return Image(.southafrica)
        case .spain:
            return Image(.spain)
        case .sweden:
            return Image(.sweden)
        case .switzerland:
            return Image(.switzerland)
        case .turkey:
            return Image(.turkey)
        case .uk:
            return Image(.uk)
        case .us:
            return Image(.us)
        }
    }
}
