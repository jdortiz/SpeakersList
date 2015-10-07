//
//  InMemorySpeakersRepo.swift
//  SpeakersList
//
//  Created by Jorge D. Ortiz Fuentes on 3/10/15.
//  Copyright © 2015 PoWWaU. All rights reserved.
//


import Foundation


class InMemorySpeakersRepo: EntityGatewayProtocol {


    // MARK: - Properties

    var speakers: [Speaker] = []
    


    // MARK: - Initializer

    init() {
    }


    // MARK: - Repository methods

    func fetchAllSpeakers() -> [Speaker] {
        return speakers
    }
}