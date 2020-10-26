//
//  EventViewModel.swift
//  MedalCase
//
//  Created by Michael Charland on 2020-10-26.
//

import UIKit

protocol EventViewModel {
    var sectionTitleKey: String {get}
    var data: [Event] {get}
    var count: Int {get}
}

extension EventViewModel {

    func getSectionTitle() -> String {
        return NSLocalizedString(sectionTitleKey, comment: "")
    }

    var count: Int {
        return data.count
    }

    func hasCompleted() -> Int {
        var result = 0
        for d in data {
            if d.hasCompleted {
                result += 1
            }
        }
        return result
    }

    func getTitle(at index: Int) -> String {
        return data[index].title
    }

    func getSubtitle(at index: Int) -> String {
        let event = data[index]
        if let event = event as? DistanceEvent {
            return formatTime(event.time)
        } else if let event = event as? ElevationEvent {
            return formatHeight(event.heightInFeet)
        }
        return ""
    }

    private func formatTime(_ time: TimeInterval) -> String {

        guard time > 0 else {
            return "Not Yet"
        }

        let timeInterval = Int(time)

        let hours = timeInterval / 3600
        let seconds = timeInterval % 60
        let minutes = timeInterval / 60 % 60

        if hours > 0 {
            return String(format: "%d:%02d:%02d", hours, minutes, seconds)
        } else {
            return String(format: "%d:%02d", minutes, seconds)
        }
    }

    private func formatHeight(_ heightInFeet: Double) -> String {
        guard heightInFeet > 0 else {
            return "Not Yet"
        }

        return "\(heightInFeet) ft"
    }

    func getImage(at index: Int) -> UIImage? {
        return UIImage(named: data[index].imageName)
    }
}
