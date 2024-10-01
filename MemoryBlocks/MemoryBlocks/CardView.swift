//
//  CardView.swift
//  MemoryBlocks
//
//  Created by bulut.oztemur on 26.08.24.
//

import SwiftUI

class Rotation: ObservableObject {
    @Published var angle: Double
    
    init(angle: Double) {
        self.angle = angle
    }
}

class Opacity: ObservableObject {
    @Published var opacity: Double
    
    init(opacity: Double) {
        self.opacity = opacity
    }
}

struct CardView: View {
    @ObservedObject var cardItem: CardItem
    @ObservedObject var rotation: Rotation = Rotation(angle: 0.0)
    @ObservedObject var opacity: Opacity = Opacity(opacity: 1.0)
    
    var body: some View {
        ZStack {
            if !cardItem.open {
                cardItem.card.defaultImage
                    .resizable()
                    .background(
                        RoundedRectangle(cornerRadius: 16, style: .continuous).fill(.clear)
                    )
                    .overlay(
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
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
        .opacity(opacity.opacity)
        .simultaneousGesture(TapGesture().onEnded {
            flipCard()
        })
        .rotation3DEffect(
            Angle(degrees: rotation.angle),
            axis: (x: 0, y: 1, z: 0)
        )
        .allowsHitTesting(!cardItem.open)
    }
    
    func flipCard() {
        withAnimation(.easeInOut(duration: 0.6)) {
            cardItem.open.toggle()
            rotation.angle += 180
        }
    }
    
    func reduceOpacity() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            withAnimation(.easeInOut(duration: 0.5)) {
                opacity.opacity = 0.2
            }
        }
    }
}

#Preview {
    CardView(cardItem: CardItem(card: .bicycle))
        .frame(width: 100, height: 100)
}
