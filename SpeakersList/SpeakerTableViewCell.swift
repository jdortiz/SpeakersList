//
//  SpeakerTableViewCell.swift
//  SpeakersList
//
//  Created by Jorge D. Ortiz Fuentes on 29/9/15.
//  Copyright © 2015 PoWWaU. All rights reserved.
//


import UIKit


class SpeakerTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
}


extension SpeakerTableViewCell: SpeakerCellProtocol {
    func displayName(name: String) {
        nameLabel.text = name
    }


    func displayTitle(title: String) {
        titleLabel.text = title
    }


    func displayDateSubmitted(date: String){
        dateLabel.text = date
    }
}