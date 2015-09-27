//
//  EntityGatewayProtocol.swift
//  SpeakersList
//
//  Created by Jorge D. Ortiz Fuentes on 26/9/15.
//  Copyright © 2015 PoWWaU. All rights reserved.
//


import Foundation


protocol EntityGatewayProtocol {
    func fetchAllSpeakers() -> [Speaker]
}
