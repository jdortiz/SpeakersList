//
//  RootConnector.swift
//  SpeakersList
//
//  Created by Jorge D. Ortiz Fuentes on 3/10/15.
//  Copyright © 2015 PoWWaU. All rights reserved.
//


import UIKit


class RootConnector {

    // MARK: - Parameters & Constants
    
    static let storyboardName = "Main"


    // MARK: - Properties

    var initialViewController: UIViewController?
    var view: SpeakersTableViewController!
    

    // MARK: - Initializers

    // This initializer must hold the logic for loading the initial view controller and get to the SpeakersTableViewController
    convenience init() {
        let storyboard = UIStoryboard(name: RootConnector.storyboardName, bundle: nil)
        let initialNavigationCtlr = storyboard.instantiateInitialViewController() as! UINavigationController
        let mainView = initialNavigationCtlr.topViewController as! SpeakersTableViewController
        self.init(view: mainView)
        initialViewController = initialNavigationCtlr
    }

    init(view: SpeakersTableViewController) {
        self.view = view
    }


    // MARK: - Methods

    func configureInitialViewController(window: UIWindow) {
        window.rootViewController = initialViewController
    }
}