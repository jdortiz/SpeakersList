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
    lazy var currentDate = NSDate()
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
        guard index < speakers.count else { return }
        let speaker = speakers[index]
        cell.displayName(speaker.name)
        cell.displayTitle(speaker.title)
        cell.displayDateSubmitted(relalitiveDateStringFromDate(speaker.dateSubmitted))
    }


    internal func relalitiveDateStringFromDate(date: NSDate) -> String {
        let calendar = NSCalendar.currentCalendar()
        if calendar.compareDate(date, toDate: currentDate, toUnitGranularity: NSCalendarUnit.Day) == NSComparisonResult.OrderedSame {
            return "Today"
        } else if calendar.compareDate(date, toDate: currentDate, toUnitGranularity: NSCalendarUnit.Month) == NSComparisonResult.OrderedSame {
            return "This month"
        }
        return "Long ago"
    }
}