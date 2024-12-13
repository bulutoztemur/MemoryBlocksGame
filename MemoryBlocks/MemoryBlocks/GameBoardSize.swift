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
    case sixfive
    case eightfive
    
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
        case .fourfour:
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
        return (width / CGFloat(isOrientationPortrait ? column : row)) - 20.0
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
        case .sixfive:
            "6x5"
        case .eightfive:
            "8x5"
        }
    }
    
    var isOrientationPortrait: Bool {
        let o = UIDevice.current.orientation
        switch o {
        case .portrait, .portraitUpsideDown:
            return true
        case .landscapeLeft, .landscapeRight:
            return false
        default:
            return true
        }
    }
}
