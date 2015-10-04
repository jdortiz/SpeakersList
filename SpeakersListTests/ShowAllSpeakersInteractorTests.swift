//
//  ShowAllSpeakersInteractorTests.swift
//  SpeakersList
//
//  Created by Jorge D. Ortiz Fuentes on 26/9/15.
//  Copyright © 2015 PoWWaU. All rights reserved.
//


import XCTest
@testable import SpeakersList


class ShowAllSpeakersInteractorTests: XCTestCase {

    // MARK: - Parameters & Constants
    
    let speakerMainName = "Juanita Banana"
    let speakerAltName = "Ellie Phant"
    let speakerMainTitle = "Life and its consequences"
    let speakerAltTitle = "My personal zoo"
    let speakerMainSynopsis = "Lots of knowlege gathered through the years"
    let speakerAltSynopsis = "I am not a zebra, neither are you."
    let speakerMainDateSubmitted = NSDate(timeIntervalSince1970: 1000)
    let speakerAltDateSubmitted = NSDate(timeIntervalSince1970: 2000)

    // MARK: - Test variables.

    var sut: ShowAllSpeakersInteractor!
    var entityGateway: EntityGatewayMock!
    var presenter: SpeakersListPresenterMock!
    

    // MARK: - Set up and tear down.
    
    override func setUp() {
        super.setUp()
        createSut()
    }

    func createSut() {
        entityGateway = EntityGatewayMock()
        presenter = SpeakersListPresenterMock()
        sut = ShowAllSpeakersInteractor(entityGateway: entityGateway)
        sut.presenter = presenter
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


    func testEntityGatewayIsSetFromInitializer() {
        XCTAssertTrue((sut.entityGateway as! EntityGatewayMock) === entityGateway,
            "Entity gateway must be set from the one provided in the initializer")
    }


    func testPresenterIsSetFromInitializer() {
        XCTAssertTrue((sut.presenter as! SpeakersListPresenterMock) === presenter,
            "Presenter must be set from the one provided in the initializer.")
    }


    func testSpeakersAreFetchedFromEntityGateway() {
        sut.showAllSpeakers()
        XCTAssertTrue(entityGateway.fetchAllSpeakersWasCalled,
            "Speakers must be fetched from the entity gateway.")
    }


    func testRepoWithNoEntitiesGeneratesNoDisplayData() {
        sut.showAllSpeakers()
        XCTAssertEqual(presenter.displayData.count, 0,
            "No data must be passed to the presenter when the repo is empty.")
    }


    func testEntityIstransformedIntoDisplayData() {
        entityGateway.entities = [Speaker(name: speakerMainName, title: speakerMainTitle,
            synopsis: speakerMainSynopsis, dateSubmitted: speakerMainDateSubmitted)]

        sut.showAllSpeakers()

        XCTAssertEqual(presenter.displayData.count, entityGateway.entities.count,
            "Only one display data must be pased to the presenter per each entity of the repo.")
        if presenter.displayData.count > 0 {
            let speakerData = presenter.displayData[0]
            XCTAssertEqual(speakerData.name, speakerMainName,
                "Speaker name must be copied onto the display data.")
            XCTAssertEqual(speakerData.title, speakerMainTitle,
                "Speaker title must be copied onto the display data.")
            XCTAssertEqual(speakerData.dateSubmitted, speakerMainDateSubmitted,
                "Speaker submitedDate must be copied onto the display data.")
        }
    }


    func testTwoEntitiesAreTransformedIntoDisplayData() {
        entityGateway.entities = [Speaker(name: speakerMainName, title: speakerMainTitle,
            synopsis: speakerMainSynopsis, dateSubmitted: speakerMainDateSubmitted),
            Speaker(name: speakerAltName, title: speakerAltTitle,
                synopsis: speakerAltSynopsis, dateSubmitted: speakerAltDateSubmitted)]

        sut.showAllSpeakers()

        XCTAssertEqual(presenter.displayData.count, entityGateway.entities.count,
            "The number of display data structs must match the number of entities in the repo.")
        if presenter.displayData.count > 0 {
            let speakerData = presenter.displayData[0]
            XCTAssertEqual(speakerData.name, speakerMainName,
                "Speaker name must be copied onto the display data.")
            XCTAssertEqual(speakerData.title, speakerMainTitle,
                "Speaker title must be copied onto the display data.")
            XCTAssertEqual(speakerData.dateSubmitted, speakerMainDateSubmitted,
                "Speaker submitedDate must be copied onto the display data.")
        }
        if presenter.displayData.count > 1 {
            let speakerData = presenter.displayData[1]
            XCTAssertEqual(speakerData.name, speakerAltName,
                "Speaker name must be copied onto the display data.")
            XCTAssertEqual(speakerData.title, speakerAltTitle,
                "Speaker title must be copied onto the display data.")
            XCTAssertEqual(speakerData.dateSubmitted, speakerAltDateSubmitted,
                "Speaker submitedDate must be copied onto the display data.")
        }
    }


    // MARK: - Stubs & Mocks
    
    class EntityGatewayMock: EntityGatewayProtocol {

        // MARK: - Properties

        var fetchAllSpeakersWasCalled = false
        var entities: [Speaker] = []


        // MARK: - Mocked Methods

        func fetchAllSpeakers() -> [Speaker] {
            fetchAllSpeakersWasCalled = true
            return entities
        }
    }


    class SpeakersListPresenterMock: SpeakersListPresenterProtocol {

        // MARK: - Properties

        var displayData: [SpeakerDisplayData] = []


        // MARK: - Mocked Methods
        
        func presentAllSpeakers(speakers: [SpeakerDisplayData]) {
            displayData = speakers
        }
    }
}
