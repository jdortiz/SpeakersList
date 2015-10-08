//
//  SpeakerEditConnector.swift
//  SpeakersList
//
//  Created by Jorge D. Ortiz Fuentes on 6/10/15.
//  Copyright © 2015 PoWWaU. All rights reserved.
//


import Foundation


class SpeakerEditConnector {
    // MARK: - Properties
    var view: SpeakerEditViewController!
    var entityGateway: EntityGatewayProtocol?
    
    func wireUp(speakerEditViewController: SpeakerEditViewController, entityGateway: EntityGatewayProtocol) {
        view = speakerEditViewController
        self.entityGateway = entityGateway
        let interactor = AddSpeakerInteractor(entityGateway: entityGateway)
        let presenter = SpeakerAddPresenter(interactor: interactor)
        
        view.eventHandler = presenter
        presenter.view = view
        interactor.presenter = presenter
        presenter.connector = self
    }
}
