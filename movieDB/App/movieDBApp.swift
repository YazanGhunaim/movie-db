//
//  movieDBApp.swift
//  movieDB
//
//  Created by Yazan Ghunaim on 9/30/23.
//

import SwiftUI
import Firebase

@main
struct movieDBApp: App {
    @StateObject var authViewModel = AuthViewModel()
    @StateObject var tabBarViewModel = TabBarViewModel()
    
    init() {
        FirebaseApp.configure()
        UITabBar.appearance().isHidden = true
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authViewModel)
                .environmentObject(tabBarViewModel)
        }
    }
}
