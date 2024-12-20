//
//  Card.swift
//  MemoryBlocks
//
//  Created by bulut.oztemur on 15.12.24.
//

import SwiftUI

protocol Card {
    var defaultImage: Image { get }
    var image: Image { get }
    var padding: CGFloat { get }
    var rawValue: Int { get }
    
    static var defaultCard: Self { get }
    static var themeImage: Image { get }
    static var themeTitle: LocalizedStringKey { get }

    static var numOfCases: Int { get }
    
    static func getCard(rawValue: Int) -> Self
    static func cards(size: Int) -> [Self]
}

extension Card {
    var defaultImage: Image { Image(.brain) }
    var image: Image {
        return Image(ImageResource(name: String(describing: self), bundle: Bundle.main))
    }
    
    var padding: CGFloat { 4.0 }
}

extension Card where Self: RawRepresentable, Self.RawValue == Int {
    static func getCard(rawValue: Int) -> Self {
        Self.init(rawValue: rawValue) ?? Self.defaultCard
    }
}

extension Card where Self: CaseIterable {
    static var numOfCases: Int {
        return Self.allCases.count
    }
}

extension Card where Self: RawRepresentable, Self.RawValue == Int, Self: CaseIterable {
    static func cards(size: Int) -> [Self] {
        var cards: [Self] = []
        let itemIndexes = Array(0 ..< numOfCases).shuffled()
        let itemIndexesForBoard = itemIndexes[0 ..< size]
        
        for index in itemIndexesForBoard {
            cards.append(getCard(rawValue: index))
        }
        return cards
    }
}
