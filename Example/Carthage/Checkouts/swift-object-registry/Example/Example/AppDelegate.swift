//
//  AppDelegate.swift
//  Example
//
//  Created by Kevin Scardina on 6/21/19.
//  Copyright © 2019 DaVita. All rights reserved.
//

import UIKit
import ObjectRegistry

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // Setup the Registry with a session data object
        ObjectRegistry.register(SessionManager.init(firstName: "Bobby",
                                                    lastName: "Barker",
                                                    token: "token",
                                                    refreshToken: "refresh"))

        return true
    }
}
