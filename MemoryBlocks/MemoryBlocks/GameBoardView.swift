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
    
    let cards = Cards.allCases
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(cards, id: \.self) { card in
                        card.image
                            .resizable()
                            .frame(width: geometry.size.width * 0.2, height: geometry.size.width * 0.2)
                            .background(.clear)
                            .padding()
                    }
                }
            }
            
        }
        .padding()

    }
}

#Preview {
    GameBoardView(gameBoard: .fourtwo)
}
