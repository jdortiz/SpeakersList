//
//  SpeakersTableViewController.swift
//  SpeakersList
//
//  Created by Jorge D. Ortiz Fuentes on 28/9/15.
//  Copyright © 2015 PoWWaU. All rights reserved.
//


import XCTest
@testable import SpeakersList


class SpeakersTableViewControllerTests: XCTestCase {

    // MARK: - Test variables.

    var sut: SpeakersTableViewController!
    var eventHandler: SpeakersListEventHandlerMock!


    // MARK: - Set up and tear down.

    override func setUp() {
        super.setUp()
        createSut()
    }


    func createSut() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewControllerWithIdentifier("SpeakersTableViewController") as! SpeakersTableViewController
        eventHandler = SpeakersListEventHandlerMock()
        sut.eventHandler = eventHandler
    }


    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }


    func destroySut() {
        sut = nil
    }
    

    // MARK: - Tests

    func testSutIsntNil() {
        XCTAssertNotNil(sut, "SUT must not be nil.")
    }


    func testEventHandlerIsPersisted() {
        XCTAssertTrue((sut.eventHandler as! SpeakersListEventHandlerMock) === eventHandler,
            "Event handler must be persisted when the property is set.")
    }


    func testViewDidLoadInvokesEventHandler() {
        let _ = sut.view
        XCTAssertTrue(eventHandler.viewDidLoadWasInvoked,
            "View did load must trigeer an event in the event handler.")
    }


    func testNumberOfRowsChangesToOneWhenConfigured() {
        sut.configureListWithNumberOfRows(1)
        XCTAssertEqual(sut.numberOfRows, 1, "Number of rows must be set with the configuration method.")
    }


    func testNumberOfRowsChangesToTwoWhenConfigured() {
        sut.configureListWithNumberOfRows(2)
        XCTAssertEqual(sut.numberOfRows, 2, "Number of rows must be set with the configuration method.")
    }


    // MARK: - Table View Data Source

    func testNumberOfRowsReturnsOneWhenConfiguredWithOneRow() {
        sut.configureListWithNumberOfRows(1)
        XCTAssertEqual(sut.tableView(sut.tableView, numberOfRowsInSection: 0), 1,
            "Number of rows of the data source must be the one configured.")
    }


    func testNumberOfRowsReturnsTwoWhenConfiguredWithTwoRows() {
        sut.configureListWithNumberOfRows(2)
        XCTAssertEqual(sut.tableView(sut.tableView, numberOfRowsInSection: 0), 2,
            "Number of rows of the data source must be the one configured.")
    }


    func testCellForRowInvokesPresentCellOfEventHandler() {
        sut.configureListWithNumberOfRows(1)
        sut.tableView(sut.tableView, cellForRowAtIndexPath: NSIndexPath(forRow: 0, inSection: 0))
        XCTAssertTrue(eventHandler.presentedCellWasInvoked,
            "The event handler must be notified to present the cell")
    }


    // MARK: - Stubs & Mocks


    class SpeakersListEventHandlerMock: SpeakersListEventHandlerProtocol {

        // MARK: - Properties

        var viewDidLoadWasInvoked = false
        var presentedCellWasInvoked = false


        // MARK: - Mocked methods

        func viewDidLoad() {
            viewDidLoadWasInvoked = true
        }


        func presentCell(cell: SpeakerTableViewCell, indexPath: NSIndexPath) {
            presentedCellWasInvoked = true
        }
    }
}
