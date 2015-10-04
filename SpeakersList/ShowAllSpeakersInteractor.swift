//
//  ShowAllSpeakersInteractor.swift
//  SpeakersList
//
//  Created by Jorge D. Ortiz Fuentes on 25/9/15.
//  Copyright © 2015 PoWWaU. All rights reserved.
//


import Foundation


class ShowAllSpeakersInteractor {

    // MARK: - Properties

    let entityGateway: EntityGatewayProtocol
    weak var presenter: SpeakersListPresenterProtocol?


    // MARK: - Initializers

    init(entityGateway: EntityGatewayProtocol) {
        self.entityGateway =  entityGateway
    }
}


extension ShowAllSpeakersInteractor: ShowAllSpeakersInteractorProtocol {
    func showAllSpeakers() {
        let entities = entityGateway.fetchAllSpeakers()
        let displayData = entities.map({entity in
            return SpeakerDisplayData(speaker: entity)})
        presenter?.presentAllSpeakers(displayData)
    }
}
