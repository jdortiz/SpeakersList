//
//  SpeakerAddPresenter.swift
//  SpeakersList
//
//  Created by Jorge D. Ortiz Fuentes on 7/10/15.
//  Copyright © 2015 PoWWaU. All rights reserved.
//


import Foundation


class SpeakerAddPresenter {

    // MARK: - Properties
    weak var view: SpeakerEditViewProtocol?
    var connector: SpeakerEditConnector?
    let interactor: AddSpeakerInteractorProtocol

    init(interactor: AddSpeakerInteractorProtocol) {
        self.interactor = interactor
    }
}


extension SpeakerAddPresenter: SpeakerEditEventHandlerProtocol {
}


extension SpeakerAddPresenter: SpeakerEditPresenterProtocol {
    
}
