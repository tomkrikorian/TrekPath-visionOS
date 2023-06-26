import SwiftUI

struct ContentView: View {
    
    @Environment(AppViewModel.self) private var viewModel
    
    var body: some View {
        TabView {
            MapView(viewModel: viewModel, camera: viewModel.selectedStepCamera)
                .tabItem {
                    Label("Map", systemImage: "map")
                }
            ElevationView(viewModel: viewModel)
                .tabItem {
                    Label("Elevation", systemImage: "chart.xyaxis.line")
                }
            ModelView(viewModel: viewModel)
                .tabItem {
                Label("3D Map", systemImage: "arkit")
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(AppViewModel())
}

