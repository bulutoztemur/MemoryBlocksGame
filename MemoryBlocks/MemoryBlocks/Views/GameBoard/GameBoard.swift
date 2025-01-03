//
//  GameBoard.swift
//  MemoryBlocks
//
//  Created by bulut.oztemur on 26.08.24.
//

import Foundation
import UIKit

enum GameBoard: CaseIterable {
    case twotwo
    case threetwo
    case fourthree
    case fourfour
    case fivefour
    case sixfour
    case sixfive
    case eightfive
    
    var row: Int {
        return switch self {
        case .twotwo:
            2
        case .threetwo:
            3
        case .fourthree:
            4
        case .fourfour:
            4
        case .fivefour:
            5
        case .sixfour:
            6
        case .sixfive:
            6
        case .eightfive:
            8
        }
    }
    
    var column: Int {
        return switch self {
        case .twotwo:
            2
        case .threetwo:
            2
        case .fourthree:
            3
        case .fourfour:
            4
        case .fivefour:
            4
        case .sixfour:
            4
        case .sixfive:
            5
        case .eightfive:
            5
        }
    }
    
    var cardSize: CGFloat {
        let width: CGFloat = UIScreen.main.bounds.width - ViewUtils.sharedInstance.safeInsetsLeft - ViewUtils.sharedInstance.safeInsetsRight
        return (width / CGFloat(ViewUtils.sharedInstance.isOrientationPortrait ? column : row)) - 12.0
    }
    
    var displayName: String {
        return switch self {
        case .twotwo:
            "2x2"
        case .threetwo:
            "3x2"
        case .fourthree:
            "4x3"
        case .fourfour:
            "4x4"
        case .fivefour:
            "5x4"
        case .sixfour:
            "6x4"
        case .sixfive:
            "6x5"
        case .eightfive:
            "8x5"
        }
    }
}
