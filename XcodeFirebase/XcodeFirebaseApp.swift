//
//  XcodeFirebaseApp.swift
//  XcodeFirebase
//
//  Created by Himanshu Churi on 1/13/22.
//

import SwiftUI
import Firebase

@main
struct XcodeFirebaseApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
