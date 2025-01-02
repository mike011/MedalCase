//
//  NetworkConnection.swift
//  MedalCase
//
//  Created by Michael Charland on 2020-10-25.
//

import Foundation

protocol NetworkConnection {
    func loadPersonalRecords() -> [Event]
    func loadVirtualEvents() -> [Event]
}
