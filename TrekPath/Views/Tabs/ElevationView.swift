//
//  ElevationView.swift
//  TrekPath
//
//  Created by Tom KRIKORIAN on 05/07/2023.
//

import SwiftUI
import Charts
import GPXKit

struct ElevationView: View {
    
    @Bindable var viewModel : AppViewModel
    @State private var altitudeData: [PlottableData] = [] // Declare a state property

    var body: some View {
        NavigationSplitView {
            List(viewModel.stepsData, selection: $viewModel.selectedStep) { step in
                Text(step.title)
            }
            .navigationTitle("Elevation")
        } detail: {
            Chart {
                ForEach(altitudeData, id: \.distance) { value in
                    LineMark(
                        x: .value("Index", value.distance),
                        y: .value("Value", value.elevation)
                    ).interpolationMethod(.catmullRom)
                }
            }
            .chartYAxisLabel("Elevation")
            .chartXAxisLabel("Distance")
            .chartLegend(spacing: 16)
            .padding()
            .clipShape(.rect(cornerRadius: 30.0))
            .onAppear {
                altitudeData = viewModel.selectedTrackGraph.heightMap.map { distanceHeight in
                    return PlottableData(distance: distanceHeight.distance, elevation: distanceHeight.elevation)
                }
            }.onChange(of: viewModel.selectedStepIndex, { oldValue, newValue in
                altitudeData = viewModel.selectedTrackGraph.heightMap.map { distanceHeight in
                    return PlottableData(distance: distanceHeight.distance, elevation: distanceHeight.elevation)
                }
            })
        }
    }
}

struct PlottableData: Identifiable {
    var id = UUID()
    var distance: Double
    var elevation: Double
}

#Preview {
    ElevationView(viewModel: AppViewModel())
}
