//
//  Card.swift
//  MemoryBlocks
//
//  Created by bulut.oztemur on 15.12.24.
//

import SwiftUI

protocol Card {
    var defaultImage: Image { get }
    var image: Image { get }
    var rawValue: Int { get }
}

extension Card {
    var defaultImage: Image { Image(.brain) }
    var image: Image {
        return Image(ImageResource(name: String(describing: self), bundle: Bundle.main))
    }
}
