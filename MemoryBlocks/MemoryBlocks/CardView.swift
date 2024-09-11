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
        ZStack {
            if !cardItem.open {
                cardItem.card.defaultImage
                    .resizable()
                    .padding(8)
                    .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.blue, lineWidth: 4)
                        )
            }
            
            if cardItem.open {
                cardItem.card.image
                    .resizable()
                    .padding(8)
                    .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.blue, lineWidth: 4)
                        )
            }
        }
        .allowsHitTesting(!cardItem.open)
    }
}

#Preview {
    CardView(cardItem: CardItem(card: .bicycle))
}
