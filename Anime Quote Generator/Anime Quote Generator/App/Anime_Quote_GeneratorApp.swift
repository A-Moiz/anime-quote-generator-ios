//
//  Anime_Quote_GeneratorApp.swift
//  Anime Quote Generator
//
//  Created by Abdul Moiz on 04/03/2026.
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
struct Anime_Quote_GeneratorApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @State private var database = Database()
    
    var body: some Scene {
        WindowGroup {
            AllQuotesView()
                .environment(database)
        }
    }
}
