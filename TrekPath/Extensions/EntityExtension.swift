//
//  EntityExtension.swift
//  TrekPath
//
//  Created by Tom KRIKORIAN on 30/08/2023.
//

import RealityKit

extension Entity {
    var visualExtents: SIMD3<Float> {
        get {
            let boundingBox = self.visualBounds(relativeTo: self)
            return boundingBox.extents
        }
    }
    
    func scaleToFit(maxLength: Float = 1.0) {
        let size = self.visualExtents
        let longestEdge = max(max(size.x, size.y), size.z)
        guard longestEdge != 0 else { return }
        let scaleFactor = (maxLength / longestEdge) * 0.7
        self.setScale([scaleFactor, scaleFactor, scaleFactor], relativeTo: nil)
    }
    
    func centerWithinParent() {
        let boundingBox = self.visualBounds(relativeTo: nil)
        let modelCenter = (boundingBox.min + boundingBox.max) / 2
        self.position = -modelCenter
    }
}
