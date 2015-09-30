//
//  SpeakersListPresenterTests.swift
//  SpeakersList
//
//  Created by Jorge D. Ortiz Fuentes on 28/9/15.
//  Copyright © 2015 PoWWaU. All rights reserved.
//


import XCTest
@testable import SpeakersList


class SpeakersListPresenterTests: XCTestCase {
    
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

    var sut: SpeakersListsPresenter!
    var view: SpeakersListViewMock!
    var interactor: ShowAllSpeakersInteractorMock!


    // MARK: - Set up and tear down.

    override func setUp() {
        super.setUp()
        createSut()
    }


    func createSut() {
        view = SpeakersListViewMock()
        interactor = ShowAllSpeakersInteractorMock()
        sut = SpeakersListsPresenter(view: view, interactor: interactor)
    }


    override func tearDown() {
        destroySut()
        super.tearDown()
    }


    func destroySut() {
        sut = nil
        view = nil
    }


    // MARK: - Tests

    func testSutIsntNil() {
        XCTAssertNotNil(sut, "SUT must not be nil.")
    }


    func testViewIsSetFromInitializer() {
        XCTAssertTrue((sut.view as! SpeakersListViewMock) === view,
            "View must be set from the one provided in the initializer.")
    }


    func testInteractorIsSetFromInitializer() {
        XCTAssertTrue((sut.interactor as! ShowAllSpeakersInteractorMock) === interactor,
            "Interactor must be set from the one provided in the initializer.")
    }


    // MARK: - Speakers List Presenter
    

    func testPresentSpeakersConfiguresViewWithNumberOfRowsWithNoSpeakers() {
        sut.presentAllSpeakers([])
        XCTAssertEqual(view.numberOfRowsconfigured, 0,
            "List in view must be configured to use the proper number of rows.")
    }


    func testPresentSpeakersConfiguresViewWithNumberOfRowsWithOneSpeaker() {
        let displayData = generateOneItemOfDisplayData()
        sut.presentAllSpeakers(displayData)
        XCTAssertEqual(view.numberOfRowsconfigured, displayData.count,
            "List in view must be configured to use the proper number of rows.")
    }


    func testPresentSpeakersConfiguresViewWithNumberOfRowsWithTwoSpeaker() {
        let displayData = generateTwoItemsOfDisplayData()
        sut.presentAllSpeakers(displayData)
        XCTAssertEqual(view.numberOfRowsconfigured, displayData.count,
            "List in view must be configured to use the proper number of rows.")
    }
    

    func testPresentSpeakersInformesViewOfNoAvailableIndexPaths() {
        sut.presentAllSpeakers([])
        XCTAssertEqual(view.indexPaths.count, 0,
            "View must be provided with no index paths when there are no rows.")
    }


    func testPresentSpeakersInformesViewOfOneAvailableIndexPath() {
        let displayData = generateOneItemOfDisplayData()
        sut.presentAllSpeakers(displayData)
        XCTAssertEqual(view.indexPaths.count, displayData.count,
            "View must be provided with index paths for the existent rows.")

        if view.indexPaths.count > 0 {
            let indexPath = view.indexPaths[0]
            XCTAssertEqual(indexPath.section, 0,
                "First section must be defined for the display data.")
            XCTAssertEqual(indexPath.row, 0,
                "First row must be used for the first item of the display data.")
        }
    }


    func testPresentSpeakersInformesViewOfTwoAvailableIndexPaths() {
        let displayData = generateTwoItemsOfDisplayData()
        sut.presentAllSpeakers(displayData)
        XCTAssertEqual(view.indexPaths.count, displayData.count,
            "View must be provided with index paths for the existent rows.")

        if view.indexPaths.count > 0 {
            let indexPath = view.indexPaths[0]
            XCTAssertEqual(indexPath.section, 0,
                "First section must be defined for the display data.")
            XCTAssertEqual(indexPath.row, 0,
                "First row must be used for the first item of the display data.")
        }
        if view.indexPaths.count > 1 {
            let indexPath = view.indexPaths[1]
            XCTAssertEqual(indexPath.section, 0,
                "First section must be defined for the display data.")
            XCTAssertEqual(indexPath.row, 1,
                "Second row must be used for the second item of the display data.")
        }
    }


    // MARK: - Speakers List Event Handler


    func testViewDidLoadInvokesInteractor() {
        sut.viewDidLoad()
        XCTAssertTrue(interactor.showAllSpeakersWasInvoked,
            "viewDidLoad must invoke the interactor.")
    }


    func testPresentCellUsesCellDisplaySpeakerData() {
        let displayData = generateOneItemOfDisplayData()
        let cell = SpeakerTableViewCellMock()
        sut.presentAllSpeakers(displayData)
        sut.presentCell(cell, indexPath: NSIndexPath(forRow: 0, inSection: 0))
        XCTAssertTrue(cell.displaySpeakerDataWasInvoked,
            "presentCell must invoke the display method of the cell.")
    }


    func testPresentCellPassesFirstElementToCellDisplay() {
        let displayData = generateOneItemOfDisplayData()
        let cell = SpeakerTableViewCellMock()
        sut.presentAllSpeakers(displayData)
        sut.presentCell(cell, indexPath: NSIndexPath(forRow: 0, inSection: 0))
        XCTAssertEqual(cell.displayedSpeakerData!, displayData[0],
            "Displayed data must correspond to the speaker in that position")
    }


    func testPresentCellPassesSecondElementToCellDisplay() {
        let displayData = generateTwoItemsOfDisplayData()
        let cell = SpeakerTableViewCellMock()
        sut.presentAllSpeakers(displayData)
        sut.presentCell(cell, indexPath: NSIndexPath(forRow: 1, inSection: 0))
        XCTAssertEqual(cell.displayedSpeakerData!, displayData[1],
            "Displayed data must correspond to the speaker in that position")
    }
    

    // MARK: - Auxiliary methods.

    func generateOneItemOfDisplayData() -> [SpeakerDisplayData] {
        let displayData = [SpeakerDisplayData(speaker: Speaker(name: speakerMainName, title: speakerMainTitle,
            synopsis: speakerMainSynopsis, dateSubmitted: speakerMainDateSubmitted))]
        return displayData
    }
    

    func generateTwoItemsOfDisplayData() -> [SpeakerDisplayData] {
        let displayData = [SpeakerDisplayData(speaker: Speaker(name: speakerMainName, title: speakerMainTitle,
            synopsis: speakerMainSynopsis, dateSubmitted: speakerMainDateSubmitted)),
            SpeakerDisplayData(speaker: Speaker(name: speakerAltName, title: speakerAltTitle,
                synopsis: speakerAltSynopsis, dateSubmitted: speakerAltDateSubmitted))]
        return displayData
    }


    // MARK: - Stubs & Mocks

    class SpeakersListViewMock: SpeakersListViewProtocol {

        // MARK: - Properties

        var numberOfRowsconfigured = -1
        var indexPaths: [NSIndexPath] = []


        // MARK: - Mocked Methods
        
        func configureListWithNumberOfRows(numberOfRows: Int) {
            numberOfRowsconfigured = numberOfRows
        }

        func addRowsAtIndexPaths(indexPaths:[NSIndexPath]) {
            self.indexPaths = indexPaths
        }
    }


    class ShowAllSpeakersInteractorMock: ShowAllSpeakersInteractorProtocol {

        // MARK: - Properties
        
        var showAllSpeakersWasInvoked = false


        // MARK: - Mocked Methods
        
        func showAllSpeakers() {
            showAllSpeakersWasInvoked = true
        }
    }


    class SpeakerTableViewCellMock: SpeakerCellProtocol {

        // MARK: - Properties
        
        var displaySpeakerDataWasInvoked = false
        var displayedSpeakerData: SpeakerDisplayData!


        // MARK: - Mocked Methods
        
        func displaySpeakerData(speaker: SpeakerDisplayData) {
            displaySpeakerDataWasInvoked = true
            displayedSpeakerData = speaker
        }
    }
}
