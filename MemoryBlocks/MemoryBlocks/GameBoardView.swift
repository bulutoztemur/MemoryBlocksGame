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

    @State private var secondCardOpened = false
    @State private var firstCardOpened = false
    
    @State private var firstCardIndex: Int = 0
    @State private var secondCardIndex: Int = 0
    
    @State private var viewModel: ViewModel
    
    private var cardViews: [CardView] = []
    
    @State private var firstCard: CardItem?
    @State private var secondCard: CardItem?
        
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
                                
                                if !firstCardOpened {
                                    firstCardOpened = true
                                    firstCard = cardViews[index].cardItem
                                    firstCardIndex = index
                                } else if !secondCardOpened {
                                    secondCardOpened = true
                                    secondCard = cardViews[index].cardItem
                                    secondCardIndex = index
                                }
                                
                                if let firstCard, let secondCard {
                                    if firstCard.card.rawValue == secondCard.card.rawValue {
                                        firstCardOpened = false
                                        secondCardOpened = false
                                        self.firstCard = nil
                                        self.secondCard = nil
                                    } else {
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                            firstCardOpened = false
                                            secondCardOpened = false
                                            firstCard.open = false
                                            secondCard.open = false
                                            self.firstCard = nil
                                            self.secondCard = nil
                                        }
                                    }
                                }
                            })
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                .allowsHitTesting(!secondCardOpened)
            }
        }
    }
}

#Preview {
    GameBoardView(gameBoard: .sixfour)
}
