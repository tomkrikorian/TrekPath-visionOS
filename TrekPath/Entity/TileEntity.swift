//
//  TileEntity.swift
//  TrekPath
//
//  Created by Tom KRIKORIAN on 30/08/2023.
//

import Foundation
import RealityKit

class TileEntity: Entity {
    private let tile: Entity
    
    init(modelName: String) async {
        do {
            tile = try await Entity(contentsOf: Bundle.main.url(forResource: modelName, withExtension: "usdz")!)
        } catch {
            fatalError("Failed to load a model asset.")
        }
        super.init()
        self.addChild(tile)
        tile.scaleToFit()
        tile.centerWithinParent()
    }
    
    @MainActor required init() {
        self.tile = Entity()
        super.init()
    }
}


