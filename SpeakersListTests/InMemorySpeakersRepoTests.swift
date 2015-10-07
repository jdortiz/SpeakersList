//
//  InMemorySpeakersRepoTests.swift
//  SpeakersList
//
//  Created by Jorge D. Ortiz Fuentes on 3/10/15.
//  Copyright © 2015 PoWWaU. All rights reserved.
//


import XCTest
@testable import SpeakersList


class InMemorySpeakersRepoTests: XCTestCase {

    // MARK: - Parameters & Constants

    let speakerMainName = "Juanita Banana"
    let speakerAltName = "Ellie Phant"
    let speakerMainTitle = "Life and its consequences"
    let speakerAltTitle = "My personal zoo"
    let speakerMainSynopsis = "Lots of knowlege gathered through the years"
    let speakerAltSynopsis = "I am not a zebra, neither are you."
    let speakerMainDateSubmitted = NSDate(timeIntervalSince1970: 1000)
    let speakerAltDateSubmitted = NSDate(timeIntervalSince1970: 2000)


    // MARK: - Test variables

    var sut: InMemorySpeakersRepo!
    var data: [Speaker] = []

    // MARK: - Set up and tear down

    override func setUp() {
        super.setUp()
        createSut()
    }


    func createSut() {
        data = createArrayWithOneSpeaker()
        sut = InMemorySpeakersRepo()
        sut.speakers = data
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


    func testFetchAllSpeakersReturnsNumberOfInitializedEntitiesWithOneItem() {
        let returnedData = sut.fetchAllSpeakers()
        XCTAssertEqual(returnedData.count, data.count,
            "Number of data returned should match the data passed onto the repo.")
    }


    func testFetchAllSpeakersReturnsInitializedEntities() {
        let returnedData = sut.fetchAllSpeakers()
        XCTAssertEqual(returnedData[0], data[0],
            "Data returned should match the data passed onto the repo.")
    }


    func testFetchAllSpeakersReturnsAltInitializedEntities() {
        data = createArrayWithOneAltSpeaker()
        sut.speakers = data
        let returnedData = sut.fetchAllSpeakers()
        XCTAssertEqual(returnedData[0], data[0],
            "Data returned should match the data passed onto the repo.")
    }
    

    func testFetchAllSpeakersReturnsNumberOfInitializedEntitiesWithTwoItems() {
        data = createArrayWithTwoSpeakers()
        sut.speakers = data
        let returnedData = sut.fetchAllSpeakers()
        XCTAssertEqual(returnedData.count, data.count,
            "Number of data returned should match the data passed onto the repo.")
    }
    

    // MARK: - Auxiliary methods

    func createArrayWithOneSpeaker() -> [Speaker] {
        return [ Speaker(name: speakerMainName, title: speakerMainTitle,
            synopsis: speakerMainSynopsis, dateSubmitted: speakerMainDateSubmitted)]
    }


    func createArrayWithOneAltSpeaker() -> [Speaker] {
        return [Speaker(name: speakerAltName, title: speakerAltTitle,
            synopsis: speakerAltSynopsis, dateSubmitted: speakerAltDateSubmitted)]
    }


    func createArrayWithTwoSpeakers() -> [Speaker] {
        return [ Speaker(name: speakerMainName, title: speakerMainTitle,
            synopsis: speakerMainSynopsis, dateSubmitted: speakerMainDateSubmitted),
            Speaker(name: speakerAltName, title: speakerAltTitle,
                synopsis: speakerAltSynopsis, dateSubmitted: speakerAltDateSubmitted)]
    }
}
