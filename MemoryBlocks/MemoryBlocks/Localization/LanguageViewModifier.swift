//
//  LanguageViewModifier.swift
//  MemoryBlocks
//
//  Created by bulut.oztemur on 15.12.24.
//

import Foundation
import SwiftUI

struct LanguageViewModifier: ViewModifier {
    @AppStorage("selectedLanguage") var language: Language = Language.defaultValue

    public func body(content: Content) -> some View {
        return content
            .environment(\.locale, Locale(identifier: language.rawValue))
    }
}
