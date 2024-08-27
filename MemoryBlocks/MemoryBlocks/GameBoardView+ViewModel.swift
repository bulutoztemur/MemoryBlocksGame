//
//  GameBoardView+ViewModel.swift
//  MemoryBlocks
//
//  Created by bulut.oztemur on 26.08.24.
//

import Foundation

extension GameBoardView {
    @Observable
    class ViewModel {
        var gameBoardSize: GameBoardSize
        var cardItems: [CardItem] = []
        
        init(gameBoardSize: GameBoardSize) {
            self.gameBoardSize = gameBoardSize
            
            for i in 0..<(gameBoardSize.column * gameBoardSize.row / 2) {
                cardItems.append(CardItem(card: Card(rawValue: i) ?? Card.bicycle))
                cardItems.append(CardItem(card: Card(rawValue: i) ?? Card.bicycle))
            }
            
            cardItems.shuffle()
        }
    }
}
