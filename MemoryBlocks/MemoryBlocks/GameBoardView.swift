//
//  GameBoardView.swift
//  MemoryBlocks
//
//  Created by bulut.oztemur on 21.08.24.
//

import SwiftUI

struct GameBoardView: View {
    var gameBoard: GameBoardSize
    
    var columns: [GridItem] {
        [GridItem](repeating: GridItem(.flexible()), count: gameBoard.column)
    }
    
    @State private var viewModel: ViewModel
    
    init(gameBoard: GameBoardSize) {
        self.gameBoard = gameBoard
        self.viewModel = ViewModel(gameBoardSize: gameBoard)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.cardItems, id: \.self) { cardItem in
                        CardView(card: cardItem.card)
                            .frame(width: geometry.size.width * 0.40, height: geometry.size.width * 0.40)
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
