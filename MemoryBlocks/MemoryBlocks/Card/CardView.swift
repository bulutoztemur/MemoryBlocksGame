//
//  CardView.swift
//  MemoryBlocks
//
//  Created by bulut.oztemur on 26.08.24.
//

import SwiftUI

class CardConfig: ObservableObject {
    @Published var angle: Double
    @Published var opacity: Double
    @Published var open: Bool
    
    init(angle: Double = 0.0, opacity: Double = 1.0, open: Bool = false) {
        self.angle = angle
        self.opacity = opacity
        self.open = open
    }
}

struct CardView: View {
    var cardItem: CardItem
    @ObservedObject private var config: CardConfig = CardConfig()
    
    var body: some View {
        
        let image = config.open ? cardItem.card.image : cardItem.card.defaultImage
        let padding: EdgeInsets = config.open ? cardItem.card.padding : EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        image
            .resizable()
            .scaleEffect(x: -1, y: 1)
            .padding(padding)
            .cornerRadius(8.0)
            .overlay(
                RoundedRectangle(cornerRadius: 8.0, style: .continuous)
                    .stroke(.blue, lineWidth: 4.0)
            )
            .opacity(config.opacity)
            .rotation3DEffect(
                Angle(degrees: config.angle),
                axis: (x: 0, y: 1, z: 0)
            )
            .allowsHitTesting(!config.open)
    }
    
    func flipCard() {
        withAnimation(.easeInOut(duration: 0.6)) {
            config.open.toggle()
            config.angle += 180
        }
    }
    
    func reduceOpacity() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            withAnimation(.easeInOut(duration: 0.5)) {
                config.opacity = 0.2
            }
        }
    }
}

#Preview {
    CardView(cardItem: CardItem(card: Vehicle.bicycle))
        .frame(width: 100, height: 100)
}
