//
//  GameBoardView+ViewModel.swift
//  MemoryBlocks
//
//  Created by bulut.oztemur on 26.08.24.
//

import Foundation

extension GameBoardView {
    @Observable
    class ViewModel: ObservableObject {
        private var gameBoard: GameBoard
        private(set) var cardViews: [CardView] = []
        
        private var firstCardIndex: Int?
        private var secondCardIndex: Int?
                
        var gameBoardEnable: Bool {
            secondCardIndex == nil
        }
        
        var maxMatch: Int
        var currentMatch: Int = 0
        var mismatch: Int = 0
        
        init(gameBoard: GameBoard) {
            self.gameBoard = gameBoard
            self.maxMatch = gameBoard.column * gameBoard.row / 2
            
            let arraySize = gameBoard.column * gameBoard.row / 2
            let allItemsIndex = Array(0..<20).shuffled()
            let itemIndexesForBoard = allItemsIndex[0 ..< arraySize]

            for i in itemIndexesForBoard {
                cardViews.append(CardView(cardItem: CardItem(card: Card(rawValue: i) ?? Card.bicycle)))
                cardViews.append(CardView(cardItem: CardItem(card: Card(rawValue: i) ?? Card.bicycle)))
            }
            
            cardViews.shuffle()
        }
        
        func checkCardOrder(_ index: Int) {
            if firstCardIndex == nil {
                firstCardIndex = index
            } else if secondCardIndex == nil {
                secondCardIndex = index
            } else {
                fatalError("EXCEPTIONAL CASE")
            }
        }
        
        private func reset() {
            firstCardIndex = nil
            secondCardIndex = nil
        }
        
        private func flipOverUnmatchedCards() {
            cardViews[firstCardIndex!].flipCard()
            cardViews[secondCardIndex!].flipCard()
        }
        
        private func cardsUnmatched() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.mismatch += 1
                self.flipOverUnmatchedCards()
                self.reset()
            }
        }
        
        private func cardsMatched() {
            currentMatch += 1
            cardViews[firstCardIndex!].reduceOpacity()
            cardViews[secondCardIndex!].reduceOpacity()
            self.reset()
        }
        
        func checkMatch() {
            if let firstCardIndex, let secondCardIndex {
                if cardViews[firstCardIndex].cardItem.card.rawValue == cardViews[secondCardIndex].cardItem.card.rawValue {
                    cardsMatched()
                } else {
                    cardsUnmatched()
                }
            }
        }
        
        func checkFinished() -> Bool {
            currentMatch == maxMatch
        }
    }
}
