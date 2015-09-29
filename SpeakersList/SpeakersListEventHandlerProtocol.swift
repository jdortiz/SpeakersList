//
//  SpeakersListEventHandlerProtocol.swift
//  SpeakersList
//
//  Created by Jorge D. Ortiz Fuentes on 28/9/15.
//  Copyright © 2015 PoWWaU. All rights reserved.
//


import Foundation
import UIKit


protocol SpeakersListEventHandlerProtocol {
    func viewDidLoad()
    func presentCell(cell: UITableViewCell, indexPath: NSIndexPath)
}
