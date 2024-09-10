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
    
    @State private var firstCardOpened = false
    @State private var secondCardOpened = false
    
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
                            .frame(width: geometry.size.width * 0.40, height: geometry.size.width * 0.40)
                            .onTapGesture {
                                cardViews[index].cardItem.open = true
                            }
                    }                    
                }
                .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
            }
        }
    }
}

#Preview {
    GameBoardView(gameBoard: .fourtwo)
}
