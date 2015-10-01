//
//  SpeakerTableViewCellTests.swift
//  SpeakersList
//
//  Created by Jorge D. Ortiz Fuentes on 1/10/15.
//  Copyright © 2015 PoWWaU. All rights reserved.
//


import XCTest
@testable import SpeakersList


class SpeakerTableViewCellTests: XCTestCase {

    // MARK: - Parameters & Constants

    let speakerMainName = "Juanita Banana"
    let speakerAltName = "Ellie Phant"
    let speakerMainTitle = "Life and its consequences"
    let speakerAltTitle = "My personal zoo"
    let speakerMainDateSubmitted = "Today"
    let speakerAltDateSubmitted = "This month"

    // MARK: - Test variables.

    var sut: SpeakerTableViewCell!


    // MARK: - Set up and tear down
    
    override func setUp() {
        super.setUp()
        createSut()
    }

    func createSut() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("SpeakersTableViewController") as! SpeakersTableViewController
        sut = vc.tableView.dequeueReusableCellWithIdentifier(SpeakersTableViewController.speakerCellIdentifier) as! SpeakerTableViewCell?
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


    // MARK: - Outlets
    

    func testTitleLabelOutletIsConnected() {
        XCTAssertNotNil(sut.titleLabel,
            "The titleLabel outlet of the cell must be connected.")
    }


    func testNameLabelOutletIsConnected() {
        XCTAssertNotNil(sut.nameLabel,
            "The titleLabel outlet of the cell must be connected.")
    }
    

    func testDateLabelOutletIsConnected() {
        XCTAssertNotNil(sut.dateLabel,
            "The titleLabel outlet of the cell must be connected.")
    }


    // MARK: - Display methods

    func testDisplayNameChangesLabelTextToMainValue() {
        let labelMock = LabelMock()
        sut.nameLabel = labelMock
        sut.displayName(speakerMainName)
        XCTAssertTrue(labelMock.setTextWasInvoked,
            "displayName must set the text of the label.")
        XCTAssertEqual(labelMock.text, speakerMainName,
            "displayName must set the text of the label to the provided text.")
    }


    func testDisplayNameChangesLabelTextToAltValue() {
        let labelMock = LabelMock()
        sut.nameLabel = labelMock
        sut.displayName(speakerAltName)
        XCTAssertTrue(labelMock.setTextWasInvoked,
            "displayName must set the text of the label.")
        XCTAssertEqual(labelMock.text, speakerAltName,
            "displayName must set the text of the label to the provided text.")
    }
    

    func testDisplayTitleChangesLabelTextToMainValue() {
        let labelMock = LabelMock()
        sut.titleLabel = labelMock
        sut.displayTitle(speakerMainTitle)
        XCTAssertTrue(labelMock.setTextWasInvoked,
            "displayTitle must set the text of the label.")
        XCTAssertEqual(labelMock.text, speakerMainTitle,
            "displayTitle must set the text of the label to the provided text.")
    }


    func testDisplayTitleChangesLabelTextToAltValue() {
        let labelMock = LabelMock()
        sut.titleLabel = labelMock
        sut.displayTitle(speakerAltTitle)
        XCTAssertTrue(labelMock.setTextWasInvoked,
            "displayTitle must set the text of the label.")
        XCTAssertEqual(labelMock.text, speakerAltTitle,
            "displayTitle must set the text of the label to the provided text.")
    }
    

    func testDisplayDateChangesLabelTextToMainValue() {
        let labelMock = LabelMock()
        sut.dateLabel = labelMock
        sut.displayDateSubmitted(speakerMainDateSubmitted)
        XCTAssertTrue(labelMock.setTextWasInvoked,
            "displayDate must set the text of the label.")
        XCTAssertEqual(labelMock.text, speakerMainDateSubmitted,
            "displayDate must set the text of the label to the provided text.")
    }
    

    func testDisplayDateChangesLabelTextToAltValue() {
        let labelMock = LabelMock()
        sut.dateLabel = labelMock
        sut.displayDateSubmitted(speakerAltDateSubmitted)
        XCTAssertTrue(labelMock.setTextWasInvoked,
            "displayDate must set the text of the label.")
        XCTAssertEqual(labelMock.text, speakerAltDateSubmitted,
            "displayDate must set the text of the label to the provided text.")
    }


    // MARK: - Stubs & Mocks

    class LabelMock: UILabel {

        // MARK: - Properties

        var setTextWasInvoked = false
        override var text: String? {
            didSet {
                setTextWasInvoked = true
            }
        }
    }
}
