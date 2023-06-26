//
//  TrekPathApp.swift
//  TrekPath
//
//  Created by Tom KRIKORIAN on 26/06/2023.
//

import SwiftUI

@main struct TrekPathApp: App {
    @State private var appViewModel = AppViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appViewModel)
        }
        
        WindowGroup(id: "model") {
            Model3DView()
                .environment(appViewModel)
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 1.0, height: 1.0, depth: 1.0, in: .meters)
    }
}
