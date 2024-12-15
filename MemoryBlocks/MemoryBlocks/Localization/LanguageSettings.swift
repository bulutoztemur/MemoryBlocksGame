//
//  LanguageSettings.swift
//  MemoryBlocks
//
//  Created by bulut.oztemur on 15.12.24.
//

import Foundation

@Observable
class LanguageSettings {
    // initialise this from UserDefaults if you like
    var language: Language {
        didSet {
            guard oldValue != self.language else { return }
            if let encoded = try? JSONEncoder().encode(self.language) {
                UserDefaults.standard.set(encoded, forKey: "language")
            }
        }
    }
    
    init() {
        if let data = UserDefaults.standard.object(forKey: "language") as? Data,
           let language = try? JSONDecoder().decode(Language.self, from: data) {
            self.language = language
        } else {
            self.language = Language(rawValue: Locale.current.language.languageCode?.identifier ?? "en") ?? .english
        }
    }
}
