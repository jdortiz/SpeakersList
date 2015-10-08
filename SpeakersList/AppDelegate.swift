//
//  AppDelegate.swift
//  SpeakersList
//
//  Created by Jorge D. Ortiz Fuentes on 25/9/15.
//  Copyright © 2015 PoWWaU. All rights reserved.
//


import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Properties

    var window: UIWindow?
    var rootConnector: RootConnector {
        get {
            return RootConnector()
        }
    }

    // MARK: - Application Delegate

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        rootConnector.configureInitialViewController(window!)
        window?.makeKeyAndVisible()
        return true
    }
}
