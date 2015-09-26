//
//  SpeakerDisplayData.swift
//  SpeakersList
//
//  Created by Jorge D. Ortiz Fuentes on 26/9/15.
//  Copyright © 2015 PoWWaU. All rights reserved.
//


import Foundation


struct SpeakerDisplayData {

    // MARK: - Properties

    let name: String
    let title: String
    let dateSubmitted: NSDate

    // MARK: - Initializer

    init(speaker: Speaker) {
        name = speaker.name
        title = speaker.title
        dateSubmitted = speaker.dateSubmitted
    }
}
