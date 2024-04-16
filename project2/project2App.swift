//
//  project2App.swift
//  project2
//
//  Created by Tarık MacBook on 19.01.2024.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseAuth

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil)
    -> Bool {
        FirebaseApp.configure()
        Auth.auth().useEmulator(withHost: "localhost",port: 9099)
        return true
    }
}

@main
struct project2App: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            NavigationView {
                AuthenticatedView {
                    Image(systemName: "dollarsign.arrow.circlepath")
                        .resizable()
                        .frame(width: 100,height: 100)
                        .foregroundColor(Color(.systemGreen))
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .clipped()
                        .padding(4)
                    Text("Welcome")
                        .font(.title)
                    Text("You need to be logged in to use this app.")
                } content: {
                    HomeView()
                    Spacer()
                }
            }
        }
    }
}
