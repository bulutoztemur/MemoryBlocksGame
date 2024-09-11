//
//  CardView.swift
//  MemoryBlocks
//
//  Created by bulut.oztemur on 26.08.24.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var cardItem: CardItem
    
    @State var rotationAngle: Double = 0.0

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
        .simultaneousGesture(TapGesture().onEnded {
            withAnimation(.easeInOut(duration: 0.5)) {
                cardItem.open = true
                rotationAngle += 180
            }
        })
        .rotation3DEffect(
            Angle(degrees: rotationAngle),
            axis: (x: 0, y: 1, z: 0)
        )
        .allowsHitTesting(!cardItem.open)
    }
}

#Preview {
    CardView(cardItem: CardItem(card: .bicycle))
}
