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

    // MARK: - Initializers

    init(speaker: Speaker) {
        name = speaker.name
        title = speaker.title
        dateSubmitted = speaker.dateSubmitted
    }


}

// MARK: - Equatable

extension SpeakerDisplayData: Equatable {}

func ==(lhs: SpeakerDisplayData, rhs: SpeakerDisplayData) -> Bool {
    if lhs.name != rhs.name { return false }
    if lhs.title != rhs.title { return false }
    if lhs.dateSubmitted != rhs.dateSubmitted { return false }
    return true
}
