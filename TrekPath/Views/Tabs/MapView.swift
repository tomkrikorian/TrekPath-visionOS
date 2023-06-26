import SwiftUI
import MapKit
import RealityKit

struct MapView: View {
    @Bindable var viewModel : AppViewModel
    @State var camera : MapCameraPosition = .automatic
    
    var body: some View {
        NavigationSplitView {
            List(viewModel.stepsData, selection: $viewModel.selectedStep) { step in
                Text(step.title)
            }
            .navigationTitle("Map")
        }
    detail: {
        Map(position: $camera)
        {
            if viewModel.selectedTrackCoordinates.count > 1, let step1 = viewModel.selectedTrackCoordinates.first, let step2 = viewModel.selectedTrackCoordinates.last {
                Marker(viewModel.stepsData[viewModel.selectedStepIndex].step1, coordinate: step1)
                Marker(viewModel.stepsData[viewModel.selectedStepIndex].step2, coordinate: step2)
                MapPolyline(coordinates: viewModel.selectedTrackGraph.coreLocationCoordinates).stroke(.blue, lineWidth: 4)
            }
            UserAnnotation()
        }
        .mapStyle(.standard(elevation: .realistic))
        .mapControls {
            MapCompass()
            MapUserLocationButton()
        }
        .onChange(of: viewModel.selectedStep, { oldValue, newValue in
            camera = viewModel.selectedStepCamera
        })
    }
    }
}

#Preview {
    MapView(viewModel: AppViewModel())
}
