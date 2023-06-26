//
//  StepData.swift
//  TrekPath
//
//  Created by Tom KRIKORIAN on 26/07/2023.
//

import Foundation

struct StepData: Hashable, Identifiable, Equatable {
    var id: UUID = UUID()
    var step1: String
    var step2: String
    var title: String
    
    static func ==(lhs: StepData, rhs: StepData) -> Bool {
        return lhs.id == rhs.id
    }
}
