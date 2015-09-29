//
//  ViewController.swift
//  SpeakersList
//
//  Created by Jorge D. Ortiz Fuentes on 25/9/15.
//  Copyright © 2015 PoWWaU. All rights reserved.
//

import UIKit

class SpeakersTableViewController: UITableViewController {

    // MARK: - Parameters & Constants
    
    static let speakerCellIdentifier = "SpeakerCell"

    // MARK: - Properties

    var eventHandler: SpeakersListEventHandlerProtocol?
    var numberOfRows = 0

    // MARK: - View Controller Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        eventHandler?.viewDidLoad()
    }


    // MARK: - Table View Data Source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(SpeakersTableViewController.speakerCellIdentifier, forIndexPath: indexPath)
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
}