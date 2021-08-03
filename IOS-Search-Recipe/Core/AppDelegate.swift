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
        UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.3657282591, green: 0.8228895068, blue: 0.6429843903, alpha: 1)
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white] 

        return true
    }
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        DropDown.startListeningToKeyboard()
    }

}

