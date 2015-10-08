//
//  SpeakersListViewProtocol.swift
//  SpeakersList
//
//  Created by Jorge D. Ortiz Fuentes on 28/9/15.
//  Copyright © 2015 PoWWaU. All rights reserved.
//


import Foundation


protocol SpeakersListViewProtocol: class {
    func configureListWithNumberOfRows(numberOfRows: Int)
    func addRowsAtIndexPaths(indexPaths:[NSIndexPath])
    func presentAddSpeakerView()
}
