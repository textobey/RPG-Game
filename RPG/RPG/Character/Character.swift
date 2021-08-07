//
//  Character.swift
//  RPG
//
//  Created by 이서준 on 2021/08/01.
//

import SpriteKit
import GameplayKit

class Character: SKSpriteNode {
    // MARK: - Variable
    // Direction //
    var currentDirection = Direction.ST
    var lastDirection = Direction.ST
    
    // Status //
    let sp = CGFloat(5)
    
    // Move //
    var speedX = CGFloat()
    var speedY = CGFloat()
    // Variable End
}
