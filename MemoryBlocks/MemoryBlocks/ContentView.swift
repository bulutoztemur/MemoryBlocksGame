//
//  ContentView.swift
//  MemoryBlocks
//
//  Created by bulut.oztemur on 21.08.24.
//

import SwiftUI

#Preview {
    ContentView()
}

struct ContentView: View {
    // Define a simple array of data
    let items = GameBoard.allCases
    
    // Define the grid layout with 2 columns
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        // Use a LazyVGrid to arrange items in a grid
        NavigationStack {
            GeometryReader { geometry in
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(items, id: \.self) { item in
                        NavigationLink(value: item) {
                            Text("\(item.displayName)")
                                .frame(width: geometry.size.width * 0.45, height: geometry.size.width * 0.45)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .font(.title)
                                .cornerRadius(32.0)
                        }
                    }
                }
                .navigationDestination(for: GameBoard.self) { item in
                    GameBoardView(gameBoard: item)
                }
            }
            .padding()
        }
    }
}


