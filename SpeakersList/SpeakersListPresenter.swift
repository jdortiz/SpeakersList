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
    let interactor: ShowAllSpeakersInteractorProtocol
    internal var speakers: [SpeakerDisplayData] = []


    // MARK: - Initializer
    
    init(view: SpeakersListViewProtocol, interactor: ShowAllSpeakersInteractorProtocol) {
        self.view = view
        self.interactor = interactor
    }
}


extension SpeakersListsPresenter: SpeakersListPresenterProtocol {
    func presentAllSpeakers(speakers: [SpeakerDisplayData]) {
        view.configureListWithNumberOfRows(speakers.count)
        self.speakers = speakers
        if (speakers.count > 0) {
            let range = 0..<speakers.count
            let indexPaths = range.map({index in return NSIndexPath(forRow: index, inSection: 0)})
            view.addRowsAtIndexPaths(indexPaths)
        }
    }
}


extension SpeakersListsPresenter: SpeakersListEventHandlerProtocol {
    func viewDidLoad() {
        interactor.showAllSpeakers()
    }


    func presentCell(cell: SpeakerCellProtocol, indexPath: NSIndexPath) {
        let index = indexPath.row
        if index < speakers.count {
            cell.displaySpeakerData(speakers[index])
        }
    }
}