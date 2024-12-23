//
//  MemoryBlocksApp.swift
//  MemoryBlocks
//
//  Created by bulut.oztemur on 21.08.24.
//

import SwiftUI
import OneSignalFramework

@main
struct MemoryBlocksApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .modifier(DarkModeViewModifier())
                .modifier(LanguageViewModifier())
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
       // Remove this method to stop OneSignal Debugging
       OneSignal.Debug.setLogLevel(.LL_VERBOSE)
        
       // OneSignal initialization
       OneSignal.initialize("6f063fd0-d97f-496c-b3f2-66057827cb7d", withLaunchOptions: launchOptions)

       // requestPermission will show the native iOS notification permission prompt.
       // We recommend removing the following code and instead using an In-App Message to prompt for notification permission
       OneSignal.Notifications.requestPermission({ accepted in
         print("User accepted notifications: \(accepted)")
       }, fallbackToSettings: true)

       // Login your customer with externalId
       // OneSignal.login("EXTERNAL_ID")
            
       return true
    }
}
