//
//  MemoryBlocksApp.swift
//  MemoryBlocks
//
//  Created by bulut.oztemur on 21.08.24.
//

import SwiftUI

@main
struct MemoryBlocksApp: App {
    @State var languageSettings = LanguageSettings()

    var body: some Scene {
        WindowGroup {
            MainView()
                .modifier(DarkModeViewModifier())
                .environment(languageSettings)
                .environment(\.locale, Locale(identifier: languageSettings.language.rawValue))
        }
    }
}
