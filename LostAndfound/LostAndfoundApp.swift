//
//  LostAndfoundApp.swift
//  LostAndfound
//
//  Created by Bayu Alif Farisqi on 14/07/23.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    
            func application(_ application: UIApplication,
                           didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            FirebaseApp.configure()

            return true
          }
    
    
    }
    
    


@main
struct LostAndfoundApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            LandingPageView().environmentObject(WriteViewModel()).environmentObject(ReadViewModel())
        }
    }
}
