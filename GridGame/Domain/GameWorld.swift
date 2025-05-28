//
//  GameWorld.swift
//  GridGame
//
//  Created by Jason Vance on 5/27/25.
//

import Foundation
import SwiftUI

enum Terrain {
    case lava
    case beach
    case water
    case desert
    case swamp
    case grass
    case mountain
    case forest
    case snow
    case pit

    var color: Color {
        switch self {
        case .lava:
            Color.red
        case .beach:
            Color.yellow
        case .water:
            Color.blue
        case .desert:
            Color.orange
        case .swamp:
            Color.purple
        case .grass:
            Color.green
        case .mountain:
            Color.gray
        case .forest:
            Color.brown
        case .snow:
            Color.white
        case .pit:
            Color.black
        }
    }
}

struct GameWorld {
    let terrain: [[Terrain]]
    
    var rows: Int { terrain.count }
    func colsIn(row: Int) -> Int { terrain[row].count }
}

extension GameWorld {
    static let sample = GameWorld(terrain: [
        [.mountain, .mountain, .snow, .snow, .water, .snow, .mountain, .mountain],
        [.mountain, .grass, .mountain, .grass, .water, .grass, .mountain, .mountain],
        [.grass, .grass, .grass, .grass, .water, .grass, .grass, .grass],
        [.grass, .grass, .grass, .water, .water, .grass, .grass, .grass],
        [.grass, .grass, .grass, .forest, .grass, .grass, .grass, .grass],
        [.grass, .grass, .grass, .water, .grass, .grass, .grass, .grass],
        [.grass, .grass, .water, .water, .grass, .grass, .grass, .grass],
        [.grass, .grass, .water, .grass, .grass, .grass, .grass, .grass]
    ])
}
