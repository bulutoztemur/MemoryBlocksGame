//
//  Language.swift
//  MemoryBlocks
//
//  Created by bulut.oztemur on 15.12.24.
//

import Foundation

enum Language: String, CaseIterable, Codable {
    static let defaultValue = Language(rawValue: Locale.current.language.languageCode?.identifier ?? "en") ?? .english
    
    case english = "en"
    case turkish = "tr"
    
    var languageString: String {
        switch self {
            case .english: return "English"
            case .turkish: return "Türkçe"
        }
    }
    
    var flagId: String {
        switch self {
            case .english: return "gb"
            case .turkish: return "tr"
        }
    }
}
