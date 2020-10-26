//
//  EventCell.swift
//  MedalCase
//
//  Created by Michael Charland on 2020-10-25.
//

import UIKit

class EventCell: UICollectionViewCell {

    static let reuseIdentifier = "Event"
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
}
