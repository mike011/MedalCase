//
//  MockNetworkConnection.swift
//  MedalCase
//
//  Created by Michael Charland on 2020-10-26.
//

import Foundation

class MockNetworkConnection: NetworkConnection {

    func loadPersonalRecords() -> [Event] {
        var result = [Event]()
        result.append(DistanceEvent(title: "Longest Run", imageName: "distance", time: 13699))
        result.append(ElevationEvent(title: "Highest Elevation", imageName: "elevation", heightInFeet: 2343.5))
        result.append(DistanceEvent(title: "Fastest 5K", imageName: "5k", time: 1813))
        result.append(DistanceEvent(title: "Fastest 10K", imageName: "10k", time: 3611))
        result.append(DistanceEvent(title: "Fastest Half Marathon", imageName: "half", time: 7111))
        result.append(DistanceEvent(title: "Fastest Marathon", imageName: "marathon", time: 0))
        return result
    }

    func loadVirtualEvents() -> [Event] {
        var result = [Event]()
        result.append(DistanceEvent(title: "Virtual Half Marathon Race", imageName: "virtualHalf", time: 7343))
        result.append(DistanceEvent(title: "Tokyo-Hakone 2020", imageName: "tokyo", time: 14324))
        result.append(DistanceEvent(title: "Virtual 10K Race", imageName: "virtual10k", time: 3534))
        result.append(DistanceEvent(title: "Hakone Ekiden", imageName: "hakone", time: 14534))
        result.append(DistanceEvent(title: "Mizuno Singapore Ekiden 2015", imageName: "mizuno", time: 9342))
        result.append(DistanceEvent(title: "Virutal 5K Race", imageName: "virtual5k", time: 1387))
        return result
    }
}
