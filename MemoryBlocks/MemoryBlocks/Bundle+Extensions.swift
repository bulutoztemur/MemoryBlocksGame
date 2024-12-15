//
//  Bundle+Extensions.swift
//  MemoryBlocks
//
//  Created by bulut.oztemur on 15.12.24.
//

import Foundation

public extension Bundle {
    var appVersion: String {
        "\(shortVersion()) (\(version()))"
    }

    func shortVersion(defaultValue: String = "unknown") -> String {
        infoDictionary?["CFBundleShortVersionString"] as? String ?? defaultValue
    }

    func version(defaultValue: String = "unknown") -> String {
        infoDictionary?["CFBundleVersion"] as? String ?? defaultValue
    }
}
