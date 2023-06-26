//
//  GeoBoundsExtension.swift
//  TrekPath
//
//  Created by Tom KRIKORIAN on 06/09/2023.
//

import Foundation
import GPXKit
import _MapKit_SwiftUI

extension GeoBounds {
    var cameraPosition : MapCameraPosition {
        let centerLatitude = (minLatitude + maxLatitude) / 2
        let centerLongitude = (minLongitude + maxLongitude) / 2
        let centerCoordinate = CLLocationCoordinate2D(latitude: centerLatitude, longitude: centerLongitude)
        let span = MKCoordinateSpan(latitudeDelta: abs(maxLatitude - minLatitude), longitudeDelta: abs(maxLongitude - minLongitude))
        let region = MKCoordinateRegion(center: centerCoordinate, span: span)
        return MapCameraPosition.region(region)
    }
}
