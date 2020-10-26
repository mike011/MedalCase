//
//  PersonalRecordsViewModel.swift
//  MedalCase
//
//  Created by Michael Charland on 2020-10-25.
//

import UIKit

struct PersonalRecordViewModel: EventViewModel {
    var sectionTitleKey: String
    var data: [Event]

    var progressInfo: String {
        return "\(hasCompleted()) of \(data.count)"
    }
}
