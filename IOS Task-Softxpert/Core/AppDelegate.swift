//
//  AppDelegate.swift
//  IOS Task-Softxpert
//
//  Created by Abeer Meckawi on 28/07/2021.
//

import UIKit
import DropDown

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window?.rootViewController = UINavigationController(rootViewController: SearchRouter.createModule())
        return true
    }
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        DropDown.startListeningToKeyboard()
    }

}

