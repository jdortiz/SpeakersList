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

    let entityGateway: EntityGatewayProtocol
    var initialViewController: UIViewController?
    var view: SpeakersTableViewController!
    var ephermeralSpeakerEditConnector: SpeakerEditConnector {
        get {
            return SpeakerEditConnector()
        }
    }

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
        let inMemorySpeakersRepo = InMemorySpeakersRepo()
        entityGateway = inMemorySpeakersRepo
        let interactor = ShowAllSpeakersInteractor(entityGateway: entityGateway)
        let presenter = SpeakersListsPresenter(interactor: interactor)
        view.eventHandler = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.connector = self
        inMemorySpeakersRepo.speakers = createSpeakersInitialData()
    }


    // MARK: - Methods

    func configureInitialViewController(window: UIWindow) {
        window.rootViewController = initialViewController
    }


    func initializeModuleForViewController(viewController: UIViewController) {
        switch viewController {
        case is SpeakerEditViewController:
            initializeSpeakerEditModule(viewController as! SpeakerEditViewController)
        default:
            fatalError("Unexpected UIViewController subclass.")
        }
    }
    
    
    func initializeSpeakerEditModule(speakerEditViewController: SpeakerEditViewController) {
        let speakerEditConnector = ephermeralSpeakerEditConnector
        speakerEditConnector.wireUp(speakerEditViewController, entityGateway: entityGateway)
    }


    private func createSpeakersInitialData() -> [Speaker] {
        return [ Speaker(name: "Dr. Evil", title: "How to Conquer the World",
            synopsis: "Plans that I will put in place soon.", dateSubmitted: NSDate()),
            Speaker(name: "Donkey Kong", title: "Throwing Barrels for Fun and Profit",
                synopsis: "Everything you wanted to know about throwing barrels.", dateSubmitted: NSDate(timeIntervalSinceNow: -200000)),
            Speaker(name: "Dr. Octopus", title: "Productivity: Doing 8 things at the same time",
                synopsis: "A productivity method for your time management issues.", dateSubmitted: NSDate(timeIntervalSinceNow: -5000000))
        ]
    }
}