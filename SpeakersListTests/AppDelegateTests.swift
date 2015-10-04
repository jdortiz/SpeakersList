//
//  AppDelegateTests.swift
//  SpeakersList
//
//  Created by Jorge D. Ortiz Fuentes on 3/10/15.
//  Copyright © 2015 PoWWaU. All rights reserved.
//


import XCTest
@testable import SpeakersList


class AppDelegateTests: XCTestCase {

    // MARK: - Test variables.

    var sut: AppDelegate!


    // MARK: - Set up and tear down.

    override func setUp() {
        super.setUp()
        createSut()
    }


    func createSut() {
        sut = AppDelegate()
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


    func testWindowIsDefinedInDidFinishLaunchingWithOptions() {
        sut.application(UIApplication.sharedApplication(), didFinishLaunchingWithOptions: nil)
        XCTAssertNotNil(sut.window,
            "Window must not be nil.")
    }


    func testRootConnectorIsAvailableWhenRequired() {
        XCTAssertNotNil(sut.rootConnector,
            "Root conneector is initialized lazily.")
    }


    func testInitialViewControllerIsConnectedToWindowInDidFinishLaunchingWithOptions() {
        let rootConnectorMock = RootConnectorMock()
        sut.rootConnector = rootConnectorMock
        sut.application(UIApplication.sharedApplication(), didFinishLaunchingWithOptions: nil)
        XCTAssertTrue(rootConnectorMock.configureInitialViewControllerWasInvoked,
            "RootConnector must be used to bind the initial view controller to the window.")
    }


    func testInitialViewControllerIsConnectedToRightWindowInDidFinishLaunchingWithOptions() {
        let rootConnectorMock = RootConnectorMock()
        sut.rootConnector = rootConnectorMock
        sut.application(UIApplication.sharedApplication(), didFinishLaunchingWithOptions: nil)
        XCTAssertEqual(sut.window, rootConnectorMock.windowConnectedToInitialViewController,
            "The initial view controller must be connected to the window in didFinishLaunchingWithOptions.")
    }
    

    // MARK: - Mocks & Stubs

    class RootConnectorMock: RootConnector {

        // MARK: - Properties

        var configureInitialViewControllerWasInvoked = false
        var windowConnectedToInitialViewController: UIWindow!


        // MARK: - Mocked methods

        override func configureInitialViewController(window: UIWindow) {
            configureInitialViewControllerWasInvoked = true
            windowConnectedToInitialViewController = window
        }
    }
}
