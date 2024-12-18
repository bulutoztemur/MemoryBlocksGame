//
//  SettingsView.swift
//  MemoryBlocks
//
//  Created by bulut.oztemur on 13.12.24.
//

import StoreKit
import SwiftUI

struct SettingsView: View {
    @Environment(\.requestReview) private var requestReview
    @AppStorage("isDarkMode") private var isDarkMode = false
    @AppStorage("selectedLanguage") private var selectedLanguage: Language = Language.defaultValue
    @AppStorage("selectedTheme") private var selectedTheme: CardTheme = CardThemeManager.shared.theme

    var body: some View {
        NavigationStack {
            VStack(content: {
                Form {
                    Section(header: Text("Theme")) {
                        Menu {
                            ForEach(Array(CardTheme.allCases), id: \.self) { theme in
                                Button {
                                    selectedTheme = theme
                                } label: {
                                    HStack {
                                        Text(theme.localizedTitle)
                                        CardThemeManager.shared.getThemeImage(cardType: theme)
                                    }
                                }
                            }
                        } label: {
                            HStack {
                                Text("Theme")
                                Spacer()
                                CardThemeManager.shared.getThemeImage(cardType: selectedTheme)
                                    .padding(.trailing, 8)
                                Text(selectedTheme.localizedTitle)
                                Image(systemName: "chevron.up.chevron.down")
                            }
                        }
                    }

                    Section(header: Text("Appearance")) {
                        Toggle(isOn: $isDarkMode) {
                            Text("Dark Mode")
                        }
                    }
                    
                    Section(header: Text("Language")) {
                        Picker("Language", selection: $selectedLanguage) {
                            ForEach(Array(Language.allCases), id: \ .self) { language in
                                Text("\(flag(for: language.flagId)) " + language.languageString)
                            }
                        }
                    }
                    
                    Section(header: Text("Share")) {
                        Button(action: shareApplication) {
                            HStack {
                                Image(systemName: "square.and.arrow.up")
                                Text("Share Application")
                            }
                        }
                    }
                    Section(header: Text("Feedback")) {
                        Button(action: {
                            requestReview()
                        }, label: {
                            HStack {
                                Image(systemName: "square.and.pencil")
                                Text("Leave a review")
                            }
                        })
                    }
                    
                    Section(header: Text("Version")) {
                        Text(Bundle.main.appVersion)
                    }
                }
            })
            .navigationTitle("Settings")
        }
    }
    
    private func shareApplication() {
        guard let url = URL(string: "https://apps.apple.com/de/app/brain-gym-memory-blocks/id6739247775?l=en-GB") else { return }
        let activityController = UIActivityViewController(activityItems: [url], applicationActivities: nil)

        if UIDevice.current.userInterfaceIdiom == .pad {
            activityController.popoverPresentationController?.sourceView = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first
            activityController.popoverPresentationController?.sourceRect = CGRect(x: UIScreen.main.bounds.width / 2.1, y: UIScreen.main.bounds.height / 2.3, width: 200, height: 200)
        }

        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let rootVC = windowScene.windows.first?.rootViewController {
            rootVC.present(activityController, animated: true, completion: nil)
        }
    }
    
    func flag(for countryCode: String) -> String {
        countryCode.uppercased().unicodeScalars.compactMap {
            UnicodeScalar(127397 + $0.value)
        }.map { String($0) }.joined()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

struct DarkModeViewModifier: ViewModifier {
    @AppStorage("isDarkMode") var isDarkMode: Bool = false

    public func body(content: Content) -> some View {
        content
            .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

