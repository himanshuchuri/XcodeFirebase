//
//  AppDelegate.swift
//  XcodeFirebase
//
//  Created by Himanshu Churi on 1/15/22.
//

import UIKit
import Firebase

class AppDelegate: UIResponder, UIApplicationDelegate{
    func application(_ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions:
                     [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
      }
    
}
