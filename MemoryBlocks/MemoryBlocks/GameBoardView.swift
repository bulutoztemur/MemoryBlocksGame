//
//  GameBoardView.swift
//  MemoryBlocks
//
//  Created by bulut.oztemur on 21.08.24.
//

import SwiftUI

struct GameBoardView: View {
    var gameBoard: GameBoard
    
    var columns: [GridItem] {
        [GridItem](repeating: GridItem(.flexible()), count: gameBoard.column)
    }
    
    @State private var firstCardIndex: Int?
    @State private var secondCardIndex: Int?
    
    @State private var viewModel: ViewModel
    
    private var cardViews: [CardView] = []
            
    var index: Int?
    
    init(gameBoard: GameBoard) {
        self.gameBoard = gameBoard
        self.viewModel = ViewModel(gameBoard: gameBoard)
        self.cardViews = self.viewModel.cardItems.map { CardView(cardItem: $0) }
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(0..<cardViews.count, id: \.self) { index in
                        cardViews[index]
                            .frame(width: gameBoard.cardSize, height: gameBoard.cardSize)
                            .simultaneousGesture(TapGesture().onEnded {
                                if firstCardIndex == nil {
                                    firstCardIndex = index
                                } else if secondCardIndex == nil {
                                    secondCardIndex = index
                                } else {
                                    fatalError("EXCEPTIONAL CASE")
                                }
                                
                                if let firstCardIndex, let secondCardIndex {
                                    if cardViews[firstCardIndex].cardItem.card.rawValue == cardViews[secondCardIndex].cardItem.card.rawValue {
                                        cardsMatched()
                                    } else {
                                        cardsUnmatched()
                                    }
                                }
                            })
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                .allowsHitTesting(secondCardIndex == nil)
            }
        }
    }
    
    func flipOverUnmatchedCards() {
        self.cardViews[firstCardIndex!].flipCard()
        self.cardViews[secondCardIndex!].flipCard()
    }
    
    func reset() {
        self.firstCardIndex = nil
        self.secondCardIndex = nil
    }
    
    func cardsUnmatched() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.flipOverUnmatchedCards()
            self.reset()
        }
    }
    
    func cardsMatched() {
        self.reset()
    }
}

#Preview {
    GameBoardView(gameBoard: .sixfour)
}
