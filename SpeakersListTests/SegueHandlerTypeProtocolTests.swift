//
//  SegueHandlerTypeProtocolTests.swift
//  SpeakersList
//
//  Created by Jorge D. Ortiz Fuentes on 5/10/15.
//  Copyright © 2015 PoWWaU. All rights reserved.
//


import XCTest
@testable import SpeakersList


class SegueHandlerTypeProtocolTests: XCTestCase {
    
    // MARK: - Parameters & Constants
    
    let firstSegueString = "FirstSegueString"
    let secondSegueString = "SecondSegueString"


    // MARK: - Test variables.
    
    var sut: SegueHandlerTypeViewControlerMock!
    

    // MARK: - Set up and tear down
    
    override func setUp() {
        super.setUp()
        createSut()
    }
    
    
    func createSut() {
        sut = SegueHandlerTypeViewControlerMock()
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
    
    
    
    func testPerformSegueWithIdentifierInvokesClassicVersion() {
        sut.performSegueWithIdentifier(SegueHandlerTypeViewControlerMock.SegueIdentifier.FirstSegue, sender: nil)
        XCTAssertNotNil(sut.identifierToPerformSegue,
            "Classic version of performSegueWithIdentifier must be invoked by the one in the protocol extension.")
    }


    func testPerformSegueWithIdentifierPassesRawValueOfFirstIdentifier() {
        sut.performSegueWithIdentifier(SegueHandlerTypeViewControlerMock.SegueIdentifier.FirstSegue, sender: nil)
        XCTAssertEqual(sut.identifierToPerformSegue, firstSegueString,
            "Identifier must correspond to the raw value of the enum case.")
    }
    
    
    func testPerformSegueWithIdentifierPassesRawValueOfSecondIdentifier() {
        sut.performSegueWithIdentifier(SegueHandlerTypeViewControlerMock.SegueIdentifier.SecondSegue, sender: nil)
        XCTAssertEqual(sut.identifierToPerformSegue, secondSegueString,
            "Identifier must correspond to the raw value of the enum case.")
    }


    
    func testPerformSegueWithIdentifierSenderPassThrough() {
        let sender = UIButton()
        sut.performSegueWithIdentifier(SegueHandlerTypeViewControlerMock.SegueIdentifier.FirstSegue, sender: sender)
        XCTAssertEqual(sut.senderPerformingSegue as? UIButton, sender,
            "Sender must be passed through.")
    }
    

    
    func testSegueIdentifierForSegueGeneratesSegueIdentifierForFirstIdentifier() {
        let segue = UIStoryboardSegue(identifier: firstSegueString, source: UIViewController(), destination: UIViewController())
        let segueIdentifier = sut.segueIdentifierForSegue(segue)
        XCTAssertEqual(segueIdentifier, SegueHandlerTypeViewControlerMock.SegueIdentifier.FirstSegue,
            "segueIdentifierForSegue must generate the corresponding case of SegueIdentifier.")
    }
    
    
    func testSegueIdentifierForSegueGeneratesSegueIdentifierForSecondIdentifier() {
        let segue = UIStoryboardSegue(identifier: secondSegueString, source: UIViewController(), destination: UIViewController())
        let segueIdentifier = sut.segueIdentifierForSegue(segue)
        XCTAssertEqual(segueIdentifier, SegueHandlerTypeViewControlerMock.SegueIdentifier.SecondSegue,
            "segueIdentifierForSegue must generate the corresponding case of SegueIdentifier.")
    }
    


    // MARK: - Mocks & Stubs
    
    class SegueHandlerTypeViewControlerMock: UIViewController, SegueHandlerTypeProtocol {

        // MARK: - Properties
        var identifierToPerformSegue: String?
        var senderPerformingSegue: AnyObject?

        enum SegueIdentifier: String {
            case FirstSegue = "FirstSegueString"
            case SecondSegue = "SecondSegueString"
        }


        // MARK: - Mocks & Stubs
        
        override func performSegueWithIdentifier(identifier: String, sender: AnyObject?) {
            identifierToPerformSegue = identifier
            senderPerformingSegue = sender
        }
    }
}
