//
//  SpeakersListPresenter.swift
//  SpeakersList
//
//  Created by Jorge D. Ortiz Fuentes on 28/9/15.
//  Copyright © 2015 PoWWaU. All rights reserved.
//


import Foundation


class SpeakersListsPresenter {

    // MARK: - Properties

    let view: SpeakersListViewProtocol


    // MARK: - Initializer
    
    init(view: SpeakersListViewProtocol) {
        self.view = view
    }
}

extension SpeakersListsPresenter: SpeakersListPresenterProtocol {
    func presentAllSpeakers(speakers: [SpeakerDisplayData]) {
        view.configureListWithNumberOfRows(speakers.count)
        if (speakers.count > 0) {
            let range = 0..<speakers.count
            let indexPaths = range.map({index in return NSIndexPath(forRow: index, inSection: 0)})
            view.addRowsAtIndexPaths(indexPaths)
        }
    }
}
