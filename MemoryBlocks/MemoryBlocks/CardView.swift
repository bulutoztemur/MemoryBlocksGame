//
//  CardView.swift
//  MemoryBlocks
//
//  Created by bulut.oztemur on 26.08.24.
//

import SwiftUI

struct CardView: View {
    var card: Card
    @State var opened = false
    
    var body: some View {
        let image: Image = opened ? card.image : card.defaultImage
        image
            .resizable()
            .padding(8)
            .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.blue, lineWidth: 4)
                )
            .onTapGesture {
               opened = true
            }
    }
}

#Preview {
    CardView(card: .bicycle)
}
