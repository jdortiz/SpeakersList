//
//  SegueHandlerTypeProtocol.swift
//  SpeakersList
//
//  Created by Jorge D. Ortiz Fuentes on 4/10/15.
//  Copyright © 2015 PoWWaU. All rights reserved.
//


import UIKit


protocol SegueHandlerTypeProtocol {
    associatedtype SegueIdentifier: RawRepresentable
}


extension SegueHandlerTypeProtocol where
    Self: UIViewController,
SegueIdentifier.RawValue == String {
    
    func performSegueWithIdentifier(segueIdentifier: SegueIdentifier, sender: AnyObject?) {
        performSegueWithIdentifier(segueIdentifier.rawValue, sender: sender)
    }


    func segueIdentifierForSegue(segue: UIStoryboardSegue) -> SegueIdentifier {
        guard let identifier = segue.identifier,
            segueIdentifier = SegueIdentifier(rawValue: identifier)
            else { fatalError("Invalid segue identifier \(segue.identifier).") }
        return segueIdentifier
    }
}
