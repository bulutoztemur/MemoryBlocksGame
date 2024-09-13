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
        
    @State private var viewModel: ViewModel
                    
    init(gameBoard: GameBoard) {
        self.gameBoard = gameBoard
        self.viewModel = ViewModel(gameBoard: gameBoard)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(0..<viewModel.cardViews.count, id: \.self) { index in
                        viewModel.cardViews[index]
                            .frame(width: gameBoard.cardSize, height: gameBoard.cardSize)
                            .simultaneousGesture(TapGesture().onEnded {
                                viewModel.checkCardOrder(index)
                                viewModel.checkMatch()
                            })
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                .allowsHitTesting(viewModel.gameBoardEnable)
            }
        }
    }
}

#Preview {
    GameBoardView(gameBoard: .sixfour)
}
