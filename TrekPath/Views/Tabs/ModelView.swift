//
//  ModelView.swift
//  TrekPath
//
//  Created by Tom KRIKORIAN on 19/10/2023.
//

import Foundation
import SwiftUI
import RealityKit

struct ModelView: View {
    
    @Bindable var viewModel : AppViewModel
    @Environment(\.openWindow) private var openWindow

    var body: some View {
        NavigationSplitView {
            List(viewModel.stepsData, selection: $viewModel.selectedStep) { step in
                Text(step.title)
            }
            .navigationTitle("3D Map")
        } detail: {
            VStack {
                Model3D(url: Bundle.main.url(forResource: viewModel.selected3dMap, withExtension: "usdz")!) { model in
                     model
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                } placeholder: {
                     ProgressView()
                 }
                Spacer()
                Button("Open 3D Map") {
                    openWindow(id: "model")
                }
            }
            .padding()
        }
    }
}

#Preview {
    ModelView(viewModel: AppViewModel())
}
