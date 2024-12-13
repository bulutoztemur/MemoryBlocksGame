//
//  ViewUtils.swift
//  MemoryBlocks
//
//  Created by bulut.oztemur on 13.12.24.
//

import UIKit

final class ViewUtils {
    static let sharedInstance: ViewUtils = {
        let instance = ViewUtils()
        return instance
    }()
    
    private init() {}
}

extension ViewUtils {
    public var safeInsetsTop: CGFloat { (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.safeAreaInsets.top ?? 0 }
    public var safeInsetsBottom: CGFloat { (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.safeAreaInsets.bottom ?? 0 }
    public var safeInsetsLeft: CGFloat { (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.safeAreaInsets.left ?? 0 }
    public var safeInsetsRight: CGFloat { (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.safeAreaInsets.right ?? 0 }
    
    public var isOrientationPortrait: Bool {
        switch UIDevice.current.orientation {
        case .portrait, .portraitUpsideDown:
            return true
        case .landscapeLeft, .landscapeRight:
            return false
        default:
            return true
        }
    }

}
