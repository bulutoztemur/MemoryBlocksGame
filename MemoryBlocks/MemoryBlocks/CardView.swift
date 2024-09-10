//
//  CardView.swift
//  MemoryBlocks
//
//  Created by bulut.oztemur on 26.08.24.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var cardItem: CardItem
    
    var body: some View {
        let image: Image = cardItem.open ? cardItem.card.image : cardItem.card.defaultImage
        image
            .resizable()
            .padding(8)
            .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.blue, lineWidth: 4)
                )
    }
}

#Preview {
    CardView(cardItem: CardItem(card: .bicycle))
}
