//
//  AppDelegate.swift
//  Calculator
//
//  Created by martin.przystalka on 10/05/2019.
//  Copyright © 2019 Martin Przystalka. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

//    swiftlint:disable line_length
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
//    swiftlint:enable line_length
        let builder = CalculatorBuilder()
        let viewController = builder.buildView()
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = viewController
        return true
    }
}
