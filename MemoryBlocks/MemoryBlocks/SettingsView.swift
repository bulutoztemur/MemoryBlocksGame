//
//  SettingsView.swift
//  MemoryBlocks
//
//  Created by bulut.oztemur on 13.12.24.
//

import SwiftUI

import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    @AppStorage("selectedLanguage") private var selectedLanguage = "English"
    
    let languages = ["English":"gb"]

    var body: some View {
        NavigationView {
            VStack(content: {
                Form {
                    Section(header: Text("Appearance")) {
                        Toggle(isOn: $isDarkMode) {
                            Text("Dark Mode")
                        }
                    }

                    Section(header: Text("Localization")) {
                        Picker("Language", selection: $selectedLanguage) {
                            ForEach(Array(languages.keys), id: \ .self) { language in
                                Text("\(flag(for: languages[language] ?? "")) " + language)
                            }
                        }
                    }

                    Section(header: Text("Application")) {
                        Button(action: shareApplication) {
                            HStack {
                                Image(systemName: "square.and.arrow.up")
                                Text("Share Application")
                            }
                        }
                    }
                    
                    Section(header: Text("Version")) {
                        Text("1.1.2")
                    }
                }
                
            })
            .navigationTitle("Settings")
        }
    }

    private func shareApplication() {
        guard let url = URL(string: "https://apps.apple.com/de/app/brain-gym-memory-blocks/id6739247775?l=en-GB") else { return }
        let activityController = UIActivityViewController(activityItems: [url], applicationActivities: nil)

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


class AppThemeViewModel: ObservableObject {
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
}

struct DarkModeViewModifier: ViewModifier {
    @ObservedObject var appThemeViewModel: AppThemeViewModel = AppThemeViewModel()
    
    public func body(content: Content) -> some View {
        content
            .preferredColorScheme(appThemeViewModel.isDarkMode ? .dark : .light)
    }
}
