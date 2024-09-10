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
        var gameBoard: GameBoard
        var cardItems: [CardItem] = []
        
        init(gameBoard: GameBoard) {
            self.gameBoard = gameBoard
            
            for i in 0..<(gameBoard.column * gameBoard.row / 2) {
                cardItems.append(CardItem(card: Card(rawValue: i) ?? Card.bicycle))
                cardItems.append(CardItem(card: Card(rawValue: i) ?? Card.bicycle))
            }
            
            cardItems.shuffle()
        }
    }
}
