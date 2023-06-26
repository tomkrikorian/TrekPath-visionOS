//
//  ViewModel.swift
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
        StepData(step1: "Belvédère", step2: "La Madone de Fenestre", description: "Day 1"),
        StepData(step1: "La Madone de Fenestre", step2: "Refuge de Nice", description: "Day 2"),
        StepData(step1: "Refuge de Nice", step2: "Refuge des Merveilles", description: "Day 3"),
        StepData(step1: "Refuge des Merveilles", step2: "Col de Turini", description: "Day 4"),
        StepData(step1: "Col de Turini", step2: "Belvédère", description: "Day 5"),
    ]
    
    var selectedStepIndex: Int {
        guard let selectedStep = selectedStep else { return nil }
        return stepsData.firstIndex(of: selectedStep) ?? 0
    }
    
    var selectedStep: StepData.ID? // Single selection.
    
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
    var selectedTrackGraph : TrackGraph {
        return tracks[currentStep].graph
    }
    
    var selectedTrackCoordinates : [CLLocationCoordinate2D] {
        return tracks[currentStep].graph.coreLocationCoordinates
    }
    
    var selectedStep : StepData {
        return stepsData[currentStep]
    }
    
    var selectedStepCamera : MapCameraPosition {
        return tracks[currentStep].bounds.cameraPosition
    }
}
