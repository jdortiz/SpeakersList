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

    
    // MARK: - UI Actions
    
    
    func testAddButtonPressedNotifiesEventHandler() {
        sut.addButtonPressed(UIBarButtonItem())
        XCTAssertTrue(eventHandler.addButtonWasPressedWasInvoked,
            "addButtonPressent must notify the event handler.")
    }
    
    
    // MARK: - Segues

    func testPresentAddSpeakerViewPerformsSegue() {
        let altSut = SpeakersTableViewControllerMock()
        altSut.presentAddSpeakerView()
        XCTAssertNotNil(altSut.performSegueWithIdentifier,
            "PresentAddSpeakerView should perform a segue to present the view controller.")
    }
    
    
    func testPresentAddSpeakerViewPerformsSegueWithExpectedIdentifier() {
        let altSut = SpeakersTableViewControllerMock()
        altSut.presentAddSpeakerView()
        XCTAssertEqual(altSut.performSegueWithIdentifier, SpeakersTableViewController.SegueIdentifier.AddSpeaker.rawValue,
            "PresentAddSpeakerView should perform the right segue to present the view controller.")
    }
    
    
    func testAddSpeakerSegueTellsEventHandlerToConfigureViewController() {
        sut.performSegueWithIdentifier(SpeakersTableViewController.SegueIdentifier.AddSpeaker,
            sender: nil)
        XCTAssertTrue(eventHandler.prepareAddSpeakerViewControllerWasInvoked,
            "AddSpeaker segue must result in the event handler configuring the view controller.")
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
        var addButtonWasPressedWasInvoked = false
        var prepareAddSpeakerViewControllerWasInvoked = false



        // MARK: - Mocked methods

        func viewDidLoad() {
            viewDidLoadWasInvoked = true
        }


        func presentCell(cell: SpeakerCellProtocol, indexPath: NSIndexPath) {
            presentedCellWasInvoked = true
        }


        func addButtonWasPressed() {
            addButtonWasPressedWasInvoked = true
        }
        
        
        func prepareAddSpeakerViewController(speakerEditViewController: SpeakerEditViewController) {
            prepareAddSpeakerViewControllerWasInvoked = true
        }
    }


    class SpeakersTableViewControllerMock: SpeakersTableViewController {

        // MARK: - Properties

        var performSegueWithIdentifier: String?
        
        
        // MARK: - Mocked methods
        
        override func performSegueWithIdentifier(identifier: String, sender: AnyObject?) {
            performSegueWithIdentifier = identifier
        }
    }
}
