//
//  Speaker.swift
//  SpeakersList
//
//  Created by Jorge D. Ortiz Fuentes on 26/9/15.
//  Copyright © 2015 PoWWaU. All rights reserved.
//


import Foundation


struct Speaker {
    let name: String
    let title: String
    let synopsis: String
    let dateSubmitted: NSDate
}

// MARK: - Equatable

extension Speaker: Equatable {}

func ==(lhs: Speaker, rhs: Speaker) -> Bool {
    if lhs.name != rhs.name { return false }
    if lhs.title != rhs.title { return false }
    if lhs.synopsis != rhs.synopsis { return false }
    if lhs.dateSubmitted != rhs.dateSubmitted { return false }
    return true
}
