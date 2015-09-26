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

    // MARK: - Test variables.

    var sut: ShowAllSpeakersInteractor!
    var entityGateway: EntityGatewayProtocol!
    var presenter: SpeakersListPresenterProtocol!
    

    // MARK: - Set up and tear down.
    
    override func setUp() {
        super.setUp()
        createSut()
    }

    func createSut() {
        entityGateway = EntityGatewayMock()
        presenter = SpeakersListPresenterMock()
        sut = ShowAllSpeakersInteractor(entityGateway: entityGateway, presenter: presenter)
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


    // MARK: - Stubs & Mocks
    
    class EntityGatewayMock: EntityGatewayProtocol {

        func fetchAllSpeakers() -> [Speaker] {
            return []
        }
    }


    class SpeakersListPresenterMock: SpeakersListPresenterProtocol {
        func presentAllSpeakers(speakers: [SpeakerDisplayData]) {
        }
    }
}
