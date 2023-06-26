//
//  Model3DView.swift
//  TrekPath
//
//  Created by Tom KRIKORIAN on 09/08/2023.
//

import Foundation
import SwiftUI
import RealityKit

struct Model3DView : View {
    @Environment(AppViewModel.self) private var viewModel

    var body: some View {
        RealityView { content in
            let model = await TileEntity(modelName: viewModel.selected3dMap)
            content.add(model)
        }
    }
}

#Preview {
    Model3DView()
        .environment(AppViewModel())
}
