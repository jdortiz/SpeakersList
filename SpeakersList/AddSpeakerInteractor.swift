//
//  AddSpeakerInteractor.swift
//  SpeakersList
//
//  Created by Jorge D. Ortiz Fuentes on 7/10/15.
//  Copyright © 2015 PoWWaU. All rights reserved.
//


import Foundation


class AddSpeakerInteractor {
    
    // MARK: - Properties
    
    let entityGateway: EntityGatewayProtocol
    weak var presenter: SpeakerEditPresenterProtocol?


    // MARK: - Initializers
    
    init(entityGateway: EntityGatewayProtocol) {
        self.entityGateway =  entityGateway
    }
}


extension AddSpeakerInteractor: AddSpeakerInteractorProtocol {
    
}