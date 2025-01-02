//
//  Event.swift
//  MedalCase
//
//  Created by Michael Charland on 2020-10-25.
//

import Foundation

protocol Event {
    var title: String {get}
    var imageName: String {get}
    var hasCompleted: Bool {get}
}
