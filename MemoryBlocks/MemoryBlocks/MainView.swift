//
//  MainView.swift
//  MemoryBlocks
//
//  Created by bulut.oztemur on 13.12.24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Play", systemImage: "play.circle")
                }

            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

#Preview {
    MainView()
        .environment(LanguageSettings())
}
