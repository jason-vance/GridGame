//
//  GameCharacter.swift
//  GridGame
//
//  Created by Jason Vance on 5/27/25.
//

import Foundation

class GameCharacter {
    
    enum CharacterType {
        case player
        case enemy
        case ally
    }
    
    var type: CharacterType
    var location: GameWorldLocation?
    
    
    init(
        type: CharacterType,
        location: GameWorldLocation? = nil
    ) {
        self.type = type
        self.location = location
    }
}

extension GameCharacter {
    static let sample = GameCharacter(
        type: .player,
        location: GameWorldLocation(row: 2, col: 2)
    )
}
