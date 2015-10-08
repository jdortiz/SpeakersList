//
//  SpeakerEditConnectorTests.swift
//  SpeakersList
//
//  Created by Jorge D. Ortiz Fuentes on 7/10/15.
//  Copyright © 2015 PoWWaU. All rights reserved.
//


import XCTest
@testable import SpeakersList


class SpeakerEditConnectorTests: XCTestCase {

    // MARK: - Test properties
    
    var sut: SpeakerEditConnector!
    
    // MARK: - Set up and tear down
    
    override func setUp() {
        super.setUp()
        createSut()
    }
    
    
    func createSut() {
        sut = SpeakerEditConnector()
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
    
    
    func testWireUpPreservesView() {
        let speakerEditViewController = SpeakerEditViewController()
        sut.wireUp(speakerEditViewController, entityGateway: InMemorySpeakersRepo())
        XCTAssertTrue(sut.view === speakerEditViewController,
            "View must be persisted when wiring up.")
    }
    
    
    func testWireUpPreservesEntityGateway() {
        let entityGateway = InMemorySpeakersRepo()
        sut.wireUp(SpeakerEditViewController(), entityGateway: entityGateway)
        XCTAssertTrue((sut.entityGateway as! InMemorySpeakersRepo) === entityGateway,
            "Entity gateway must be persisted when wiring up.")
    }
    
    
    func testWireUpConnectsViewWithEventHandler() {
        let speakerEditViewController = SpeakerEditViewController()
        sut.wireUp(speakerEditViewController, entityGateway: InMemorySpeakersRepo())
        XCTAssertNotNil(sut.view.eventHandler,
            "Main view controller must be connected with an event handler.")
    }

    
    func testWireUpConnectsPresenterWithView() {
        let speakerEditViewController = SpeakerEditViewController()
        sut.wireUp(speakerEditViewController, entityGateway: InMemorySpeakersRepo())
        let presenter = sut.view.eventHandler as? SpeakerAddPresenter
        let view = presenter?.view as? SpeakerEditViewController
        XCTAssertEqual(view, sut.view,
            "Presenter must be connected with the main view.")
    }
    

    func testWireUpConnectsPresenterWithInteractor() {
        let speakerEditViewController = SpeakerEditViewController()
        sut.wireUp(speakerEditViewController, entityGateway: InMemorySpeakersRepo())
        let presenter = sut.view.eventHandler as? SpeakerAddPresenter
        XCTAssertNotNil(presenter?.interactor,
            "Presenter must be connected with the interactor.")
    }
    

    func testWireUpConnectsInteractorWithPresenter() {
        let speakerEditViewController = SpeakerEditViewController()
        sut.wireUp(speakerEditViewController, entityGateway: InMemorySpeakersRepo())
        let presenter = sut.view.eventHandler as? SpeakerAddPresenter
        let interactor = presenter?.interactor as? AddSpeakerInteractor
        XCTAssertNotNil(interactor?.presenter,
            "Interactor must be connected with the presenter.")
    }
    
    
    func testWireUpConnectsInteractorWithThisConnector() {
        let speakerEditViewController = SpeakerEditViewController()
        sut.wireUp(speakerEditViewController, entityGateway: InMemorySpeakersRepo())
        let presenter = sut.view.eventHandler as? SpeakerAddPresenter
        guard let connector = presenter?.connector else {
            XCTFail("Presenter must be connected with the connector")
            return
        }
        XCTAssertTrue(connector === sut!,
                "Presenter must be connected with the connector.")
    }
}
