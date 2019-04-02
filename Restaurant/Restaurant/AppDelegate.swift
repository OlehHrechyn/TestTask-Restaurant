//
//  AppDelegate.swift
//  Restaurant
//
//  Created by Oleh Hrechyn on 4/1/19.
//  Copyright © 2019 Natife. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupWindow()
        return true
    }
}

//Private
private extension AppDelegate {
    func setupWindow() {
        window = UIWindow()
        window?.rootViewController = FoodListViewController()
        window?.makeKeyAndVisible()
    }
}
