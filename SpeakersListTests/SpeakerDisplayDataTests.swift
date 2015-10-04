//
//  SpeakerDisplayDataTests.swift
//  SpeakersList
//
//  Created by Jorge D. Ortiz Fuentes on 27/9/15.
//  Copyright © 2015 PoWWaU. All rights reserved.
//


import XCTest
@testable import SpeakersList


class SpeakerDisplayDataTests: XCTestCase {
    
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

    var sut: SpeakerDisplayData!

    // MARK: - Set up and tear down.

    override func setUp() {
        super.setUp()
        createSut()
    }

    func createSut() {
        sut = SpeakerDisplayData(speaker: Speaker(name: speakerMainName, title: speakerMainTitle,
            synopsis: speakerMainSynopsis, dateSubmitted: speakerMainDateSubmitted))
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
        XCTAssertEqual(sut.name, speakerMainName, "Name must be extracted from the provided speaker.")
    }


    func testNameIsExtractedFromAltSpeaker() {
        let altSut = createAltSut()

        XCTAssertEqual(altSut.name, speakerAltName, "Name must be extracted from the provided speaker.")
    }


    func testTitleIsExtractedFromMainSpeaker() {
        XCTAssertEqual(sut.title, speakerMainTitle, "Title must be extracted from the provided speaker.")
    }


    func testTitleIsExtractedFromAltSpeaker() {
        let altSut = createAltSut()

        XCTAssertEqual(altSut.title, speakerAltTitle, "Title must be extracted from the provided speaker.")
    }


    func testDateSubmittedIsExtractedFromMainSpeaker() {
        XCTAssertEqual(sut.dateSubmitted, speakerMainDateSubmitted, "Date submitted must be extracted from the provided speaker.")
    }


    func testDateSubmittedIsExtractedFromAltSpeaker() {
        let altSut = createAltSut()

        XCTAssertEqual(altSut.dateSubmitted, speakerAltDateSubmitted, "Date submitted must be extracted from the provided speaker.")
    }


    // MARK: - Equatable

    func testInstanceIsEqualToItself() {
        XCTAssertEqual(sut, sut,
            "A SpeakerDisplayData instance must be equal to itself.")
    }


    func testInstanceIsDifferentIfNameIsDifferent() {
        XCTAssertNotEqual(sut, SpeakerDisplayData(speaker: Speaker(name: speakerAltName, title: speakerMainTitle,
            synopsis: speakerMainSynopsis, dateSubmitted: speakerMainDateSubmitted)),
            "SpeakerDisplayData instances must be different if the name is different.")
    }


    func testInstanceIsDifferentIfTitleIsDifferent() {
        XCTAssertNotEqual(sut, SpeakerDisplayData(speaker: Speaker(name: speakerMainName, title: speakerAltTitle,
            synopsis: speakerMainSynopsis, dateSubmitted: speakerMainDateSubmitted)),
            "SpeakerDisplayData instances must be different if the title is different.")
    }
    

    func testInstanceIsDifferentIfDateSubmittedIsDifferent() {
        XCTAssertNotEqual(sut, SpeakerDisplayData(speaker: Speaker(name: speakerMainName, title: speakerMainTitle,
            synopsis: speakerMainSynopsis, dateSubmitted: speakerAltDateSubmitted)),
            "SpeakerDisplayData instances must be different if the date submitted is different.")
    }


    func createAltSut() -> SpeakerDisplayData {
        return SpeakerDisplayData(speaker: Speaker(name: speakerAltName, title: speakerAltTitle,
            synopsis: speakerAltSynopsis, dateSubmitted: speakerAltDateSubmitted))
    }
}
