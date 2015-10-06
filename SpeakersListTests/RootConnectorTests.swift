//
//  RootConnectorTests.swift
//  SpeakersList
//
//  Created by Jorge D. Ortiz Fuentes on 3/10/15.
//  Copyright © 2015 PoWWaU. All rights reserved.
//


import XCTest
@testable import SpeakersList


class RootConnectorTests: XCTestCase {

    // MARK: - Test variables.

    var sut: RootConnector!
    var viewController: SpeakersTableViewController!


    // MARK: - Set up and tear down.

    override func setUp() {
        super.setUp()
        createSut()
    }


    func createSut() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        viewController = storyboard.instantiateViewControllerWithIdentifier(SpeakersTableViewController.storyboardIdentifier) as! SpeakersTableViewController
        sut = RootConnector()
    }


    override func tearDown() {
        destroySut()
        super.tearDown()
    }


    func destroySut() {
        sut = nil
    }


    // MARK: - Tests

    func testSutIsntNil() {
        XCTAssertNotNil(sut, "SUT must not be nil.")
    }


    func testViewControllerSetsMainViewController() {
        XCTAssertNotNil(sut.view,
            "Main view controller of this connector must be defined from the convenience initializer.")
    }


    func testConvenienceInitializerSetsInitialViewController() {
        XCTAssertNotNil(sut.initialViewController,
            "Initial view controller must be set in the convenience initializer.")
    }


    func testConfigureInitialViewControllerSetsVCAsRootViewController() {
        let windowMock =  WindowMock()
        sut.configureInitialViewController(windowMock)
        XCTAssertEqual(windowMock.newRootViewController, sut.initialViewController,
            "Initial view controller must be configured as the root view controller of the window.")
    }


    func testViewIsConnectedWithEventHandler() {
        XCTAssertNotNil(sut.view.eventHandler,
            "Main view controller must be connected with an event handler.")
    }


    func testPresenterIsConnectedWithView() {
        let presenter = sut.view.eventHandler as? SpeakersListsPresenter
        let view = presenter?.view as? SpeakersTableViewController
        XCTAssertEqual(view, sut.view,
            "Presenter must be connected with a the main view.")
    }


    func testPresenterIsConnectedWithInteractor() {
        let presenter = sut.view.eventHandler as? SpeakersListsPresenter
        XCTAssertNotNil(presenter?.interactor,
            "Presenter must be connected with an interactor.")
    }
    

    func testInteractorIsConnectedWithPresenter() {
        let presenter = sut.view.eventHandler as? SpeakersListsPresenter
        let interactor = presenter?.interactor as? ShowAllSpeakersInteractor
        XCTAssertNotNil(interactor?.presenter,
            "Presenter must be connected with an interactor.")
    }


    
    func testPresenterRetainsThisConnector() {
        let presenter = sut.view.eventHandler as? SpeakersListsPresenter
        guard let connector = presenter?.connector else {
            XCTFail("Presenter must have a reference to a connector.")
            return
        }
        XCTAssertTrue(connector === sut!,
            "Presenter must connect back to the connector.")
    }

    
    func testInitializeModuleInvokesRightMethodWithSpeakerEditViewController() {
        let speakerEditConnectorMock = SpeakerEditConnectorMock()
        let altSut = RootConnectorMock()
        altSut.speakerEditConnectorMock = speakerEditConnectorMock
        altSut.initializeModuleForViewController(SpeakerEditViewController())

        XCTAssertTrue(speakerEditConnectorMock.wireUpWasInvoked,
        "Module initialization for SpeakerEditViewController invokes wireUp in the new connector.")
    }


    class WindowMock: UIWindow {

        // MARK: - Properties

        var newRootViewController: UIViewController?


        // MARK: - Mocked methods

        override var rootViewController: UIViewController? {
            didSet {
                newRootViewController = rootViewController
            }
        }
    }


    class RootConnectorMock: RootConnector {

        // MARK: - Properties
        var speakerEditConnectorMock: SpeakerEditConnectorMock?
        override var ephermeralSpeakerEditConnector: SpeakerEditConnector {
            get {
                return speakerEditConnectorMock!
            }
        }
    }

    
    class SpeakerEditConnectorMock: SpeakerEditConnector {
    
        var wireUpWasInvoked = false
        override func wireUp(speakerEditViewController: SpeakerEditViewController) {
            wireUpWasInvoked = true
        }
        
        func dealloc () {
            print("Speaker Edit Connnector DEALLOCATED")
        }
    }
}
