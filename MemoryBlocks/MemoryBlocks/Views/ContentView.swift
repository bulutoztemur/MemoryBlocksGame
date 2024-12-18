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
    
    var numOfColums: Int {
        switch UIDevice.current.userInterfaceIdiom {
        case .pad:
            return Int(ViewUtils.sharedInstance.widthWithoutSafeInsets / 240)
        default:
            return 2
        }
    }
    
    var columns: [GridItem] {
        [GridItem](repeating: GridItem(.flexible()), count: numOfColums)
    }

    var body: some View {
        // Use a LazyVGrid to arrange items in a grid
        NavigationStack {
            GeometryReader { geometry in
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(items, id: \.self) { item in
                            NavigationLink(value: item) {
                                Text("\(item.displayName)")
                                    .frame(width: menuItemSize(geometry: geometry), height: menuItemSize(geometry: geometry))
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .cornerRadius(32.0)
                            }
                        }
                    }
                }
                .navigationDestination(for: GameBoard.self) { item in
                    GameBoardView(gameBoard: item)
                }
            }
            .padding()
            .navigationTitle("Game Board Sizes")
        }
    }
    
    func menuItemSize(geometry: GeometryProxy) -> CGFloat {
        let size = (geometry.size.width / CGFloat(numOfColums)) - 16
        return max(size, 32.0)
    }
}


