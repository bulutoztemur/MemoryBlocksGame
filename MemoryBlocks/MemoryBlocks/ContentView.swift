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
    let items = ["2x2", "2x3", "2x4", "4x6"]
    
    // Define the grid layout with 2 columns
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        // Use a LazyVGrid to arrange items in a grid
        GeometryReader { geometry in
            LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(items, id: \.self) { item in
                            Button {
                                // Perform action here
                            } label: {
                                Text("\(item)")
                                    .frame(width: geometry.size.width * 0.4, height: geometry.size.width * 0.4)
                                    .background(Color.blue)
                                    .foregroundColor(.black)
                            }
                            
                        }
            }
            .padding()
        }
    }
}

