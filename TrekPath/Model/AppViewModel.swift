//
//  AppViewModel.swift
//  TrekPath
//
//  Created by Tom KRIKORIAN on 07/07/2023.
//

import Foundation
import Observation
import SwiftUI
import MapKit
import GPXKit

@Observable class AppViewModel {
    var tracks : [GPXTrack] = [GPXTrack]()
    var stepsData : [StepData] = [
        StepData(step1: "Belvédère", step2: "La Madone de Fenestre", title: "Day 1"),
        StepData(step1: "La Madone de Fenestre", step2: "Refuge de Nice", title: "Day 2"),
        StepData(step1: "Refuge de Nice", step2: "Refuge des Merveilles", title: "Day 3"),
        StepData(step1: "Refuge des Merveilles", step2: "Col de Turini", title: "Day 4"),
        StepData(step1: "Col de Turini", step2: "Belvédère", title: "Day 5"),
    ]
    var selectedStep: StepData.ID?
    
    init() {
        for i in 1...5 {
            if let url = Bundle.main.url(forResource: "day\(i)", withExtension: ".gpx"), let parser = GPXFileParser(url: url) {
                switch parser.parse() {
                case .success(let track):
                    tracks.append(track)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}

extension AppViewModel {
    var selectedStepIndex: Int {
        guard let selectedStep = selectedStep else { return 0 }
        return stepsData.firstIndex { $0.id == selectedStep } ?? 0
    }
    
    var selectedTrackGraph : TrackGraph {
        return tracks[selectedStepIndex].graph
    }
    
    var selectedTrackCoordinates : [CLLocationCoordinate2D] {
        return tracks[selectedStepIndex].graph.coreLocationCoordinates
    }
    
    var selectedStepCamera : MapCameraPosition {
        return tracks[selectedStepIndex].bounds.cameraPosition
    }
    
    var selected3dMap : String {
        return "map\(selectedStepIndex + 1)"
    }
}
