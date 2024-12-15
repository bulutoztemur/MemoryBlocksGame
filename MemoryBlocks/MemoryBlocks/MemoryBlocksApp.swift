//
//  MemoryBlocksApp.swift
//  MemoryBlocks
//
//  Created by bulut.oztemur on 21.08.24.
//

import SwiftUI

@main
struct MemoryBlocksApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .modifier(DarkModeViewModifier())
                .modifier(LanguageViewModifier())
                // .environment(\.locale, Locale(identifier: LanguageSettingsManager.shared.language.rawValue))
        }
    }
}
