//
//  ElevationEvent.swift
//  MedalCase
//
//  Created by Michael Charland on 2020-10-26.
//

import Foundation

struct ElevationEvent: Event {
    var title: String
    var imageName: String
    var heightInFeet: Double
    var hasCompleted: Bool {
        return heightInFeet != 0
    }
}
