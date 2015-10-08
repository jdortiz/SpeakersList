//
//  AddSpeakerInteractorTests.swift
//  SpeakersList
//
//  Created by Jorge D. Ortiz Fuentes on 7/10/15.
//  Copyright © 2015 PoWWaU. All rights reserved.
//


import XCTest
@testable import SpeakersList


class AddSpeakerInteractorTests: XCTestCase {
    
    // MARK: - Test variables.
    
    var sut: AddSpeakerInteractor!
    var entityGateway: EntityGatewayMock!
//    var presenter: SpeakersListPresenterMock!
    
    
    // MARK: - Set up and tear down.
    
    override func setUp() {
        super.setUp()
        createSut()
    }
    
    func createSut() {
        entityGateway = EntityGatewayMock()
//        presenter = SpeakersListPresenterMock()
        sut = AddSpeakerInteractor(entityGateway: entityGateway)
//        sut.presenter = presenter
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
}
