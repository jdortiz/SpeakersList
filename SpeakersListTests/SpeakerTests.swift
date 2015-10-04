//
//  SpeakerTests.swift
//  SpeakersList
//
//  Created by Jorge D. Ortiz Fuentes on 3/10/15.
//  Copyright © 2015 PoWWaU. All rights reserved.
//


import XCTest
@testable import SpeakersList


class SpeakerTests: XCTestCase {
    
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

    var sut: Speaker!


    // MARK: - Set up and tear down.

    override func setUp() {
        super.setUp()
        createSut()
    }


    func createSut() {
        sut = Speaker(name: speakerMainName, title: speakerMainTitle,
            synopsis: speakerMainSynopsis, dateSubmitted: speakerMainDateSubmitted)
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
    

    func testNameIsExtractedFromMainSpeaker() {
        XCTAssertEqual(sut.name, speakerMainName, "Name must be set from the provided data.")
    }


    func testNameIsExtractedFromAltSpeaker() {
        let altSut = createAltSut()

        XCTAssertEqual(altSut.name, speakerAltName, "Name must be set from the provided data.")
    }


    func testTitleIsExtractedFromMainSpeaker() {
        XCTAssertEqual(sut.title, speakerMainTitle, "Title must be set from the provided data.")
    }


    func testTitleIsExtractedFromAltSpeaker() {
        let altSut = createAltSut()

        XCTAssertEqual(altSut.title, speakerAltTitle, "Title must be set from the provided data.")
    }


    func testSynopsisIsExtractedFromMainSpeaker() {
        XCTAssertEqual(sut.synopsis, speakerMainSynopsis, "Synopsis must be set from the provided data.")
    }


    func testSynopsisIsExtractedFromAltSpeaker() {
        let altSut = createAltSut()

        XCTAssertEqual(altSut.synopsis, speakerAltSynopsis, "Synopsis must be set from the provided data.")
    }
    

    func testDateSubmittedIsExtractedFromMainSpeaker() {
        XCTAssertEqual(sut.dateSubmitted, speakerMainDateSubmitted, "Date submitted must be set from the provided data.")
    }


    func testDateSubmittedIsExtractedFromAltSpeaker() {
        let altSut = createAltSut()

        XCTAssertEqual(altSut.dateSubmitted, speakerAltDateSubmitted, "Date submitted must be set from the provided data.")
    }


    // MARK: - Equatable

    func testInstanceIsEqualToItself() {
        XCTAssertEqual(sut, sut,
            "A Speaker instance must be equal to itself.")
    }


    func testInstanceIsDifferentIfNameIsDifferent() {
        XCTAssertNotEqual(sut, Speaker(name: speakerAltName, title: speakerMainTitle,
            synopsis: speakerMainSynopsis, dateSubmitted: speakerMainDateSubmitted),
            "Speaker instances must be different if the name is different.")
    }


    func testInstanceIsDifferentIfTitleIsDifferent() {
        XCTAssertNotEqual(sut, Speaker(name: speakerMainName, title: speakerAltTitle,
            synopsis: speakerMainSynopsis, dateSubmitted: speakerMainDateSubmitted),
            "Speaker instances must be different if the title is different.")
    }


    func testInstanceIsDifferentIfSynopsisIsDifferent() {
        XCTAssertNotEqual(sut, Speaker(name: speakerMainName, title: speakerMainTitle,
            synopsis: speakerAltSynopsis, dateSubmitted: speakerMainDateSubmitted),
            "Speaker instances must be different if the title is different.")
    }
    

    func testInstanceIsDifferentIfDateSubmittedIsDifferent() {
        XCTAssertNotEqual(sut, Speaker(name: speakerMainName, title: speakerMainTitle,
            synopsis: speakerMainSynopsis, dateSubmitted: speakerAltDateSubmitted),
            "Speaker instances must be different if the date submitted is different.")
    }


    func createAltSut() -> Speaker {
        return Speaker(name: speakerAltName, title: speakerAltTitle,
            synopsis: speakerAltSynopsis, dateSubmitted: speakerAltDateSubmitted)
    }
}
