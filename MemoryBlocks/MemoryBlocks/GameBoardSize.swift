//
//  GameBoardSize.swift
//  MemoryBlocks
//
//  Created by bulut.oztemur on 26.08.24.
//

import Foundation

enum GameBoardSize: CaseIterable {
    case twotwo
    case threetwo
    case fourtwo
    case sixfour
    
    var row: Int {
        return switch self {
        case .twotwo:
            2
        case .threetwo:
            3
        case .fourtwo:
            4
        case .sixfour:
            6
        }
    }
    
    var column: Int {
        return switch self {
        case .twotwo:
            2
        case .threetwo:
            2
        case .fourtwo:
            2
        case .sixfour:
            4
        }
    }
    
    var displayName: String {
        return switch self {
        case .twotwo:
            "2x2"
        case .threetwo:
            "3x2"
        case .fourtwo:
            "4x2"
        case .sixfour:
            "6x4"
        }
    }
}
