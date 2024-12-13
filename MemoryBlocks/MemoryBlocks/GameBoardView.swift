//
//  GameBoardView.swift
//  MemoryBlocks
//
//  Created by bulut.oztemur on 21.08.24.
//

import SwiftUI

struct GameBoardView: View {
    @Environment(\.dismiss) private var dismiss
    
    var gameBoard: GameBoard
        
    var columns: [GridItem] {
        [GridItem](repeating: GridItem(.flexible()), count: ViewUtils.sharedInstance.isOrientationPortrait ? gameBoard.column : gameBoard.row)
    }
    
    @State private var viewModel: ViewModel
    @State private var timerActive: Bool = false
    @State private var isGameFinished: Bool = false
                    
    init(gameBoard: GameBoard) {
        self.gameBoard = gameBoard
        self.viewModel = ViewModel(gameBoard: gameBoard)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical, showsIndicators: false) {
                let _ = geometry.size.width
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(0 ..< viewModel.cardViews.count, id: \.self) { index in
                        viewModel.cardViews[index]
                            .frame(width: gameBoard.cardSize, height: gameBoard.cardSize)
                            .simultaneousGesture(TapGesture().onEnded {
                                timerActive = true
                                viewModel.checkCardOrder(index)
                                viewModel.checkMatch()
                                isGameFinished = viewModel.checkFinished()
                                timerActive = !isGameFinished
                            })
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                .allowsHitTesting(viewModel.gameBoardEnable)

                HStack(alignment: .top, spacing: 16) {
                    TimeCounterView(timerActive: $timerActive)
                    Spacer()
                    VStack(alignment: .trailing , spacing: 8) {
                        Text("Match: \(viewModel.currentMatch)/\(viewModel.maxMatch)")
                            .font(.title2)
                        Text("Mismatch: \(viewModel.mismatch)")
                            .font(.title2)
                            .foregroundStyle(.red)
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
            }
            .alert("CONGRATULATIONS", isPresented: $isGameFinished) {
                Button("YES") {
                    dismiss()
                }
                Button(role: .cancel, action: {
                    
                }, label: {
                    Text("NO")
                        .foregroundStyle(.red)
                })
            } message: {
                Text("Do you want to go to main screen?")
            }
        }
    }
}

#Preview {
    GameBoardView(gameBoard: .sixfive)
}
