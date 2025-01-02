//
//  DistanceEvent.swift
//  MedalCase
//
//  Created by Michael Charland on 2020-10-26.
//

import Foundation

struct DistanceEvent: Event {
    var title: String
    var imageName: String
    var time: TimeInterval
    var hasCompleted: Bool {
        return time != 0
    }
}
