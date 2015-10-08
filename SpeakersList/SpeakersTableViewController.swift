//
//  ViewController.swift
//  SpeakersList
//
//  Created by Jorge D. Ortiz Fuentes on 25/9/15.
//  Copyright © 2015 PoWWaU. All rights reserved.
//


import UIKit


class SpeakersTableViewController: UITableViewController, SegueHandlerTypeProtocol {

    // MARK: - Parameters & Constants

    static let storyboardIdentifier = "SpeakersTableViewController"
    static let speakerCellIdentifier = "SpeakerCell"
    enum SegueIdentifier: String {
        case AddSpeaker = "AddSpeaker"
    }


    // MARK: - Properties

    var eventHandler: SpeakersListEventHandlerProtocol?
    var numberOfRows = 0

    // MARK: - View Controller Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        eventHandler?.viewDidLoad()
    }


    // MARK: - UI Actions
    
    @IBAction func addButtonPressed(sender: UIBarButtonItem) {
        eventHandler?.addButtonWasPressed()
    }

    
    // MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let segueIdentifier = segueIdentifierForSegue(segue)
        switch segueIdentifier {
        case .AddSpeaker:
            let navigationController = segue.destinationViewController as! UINavigationController
            eventHandler?.prepareAddSpeakerViewController(navigationController.topViewController as! SpeakerEditViewController)
        }
    }
    
    // MARK: - Table View Data Source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(SpeakersTableViewController.speakerCellIdentifier, forIndexPath: indexPath) as! SpeakerTableViewCell
        eventHandler?.presentCell(cell, indexPath: indexPath)
        return cell
    }
}


extension SpeakersTableViewController: SpeakersListViewProtocol {
    func configureListWithNumberOfRows(numberOfRows: Int) {
        self.numberOfRows = numberOfRows
    }


    func addRowsAtIndexPaths(indexPaths:[NSIndexPath]) {

    }
    
    
    func presentAddSpeakerView() {
        performSegueWithIdentifier(SegueIdentifier.AddSpeaker, sender: self)
    }
}
