//
//  AppDelegate.swift
//  Fire Label
//
//  Created by Morten Gustafsson on 2/14/19.
//  Copyright © 2019 Morten Gustafsson. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)

        let viewController = ViewController()
        window?.rootViewController = viewController

        window?.makeKeyAndVisible()

        return true
    }
}
