//
//  GameBoardSize.swift
//  MemoryBlocks
//
//  Created by bulut.oztemur on 26.08.24.
//

import Foundation
import UIKit

enum GameBoard: CaseIterable {
    case twotwo
    case threetwo
    case fourfour
    case sixfour
    
    var row: Int {
        return switch self {
        case .twotwo:
            2
        case .threetwo:
            3
        case .fourfour:
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
        case .fourfour:
            4
        case .sixfour:
            4
        }
    }
    
    var cardSize: CGFloat {
        (UIScreen.main.bounds.width / CGFloat(column)) - 20.0
    }
    
    var displayName: String {
        return switch self {
        case .twotwo:
            "2x2"
        case .threetwo:
            "3x2"
        case .fourfour:
            "4x4"
        case .sixfour:
            "6x4"
        }
    }
}
