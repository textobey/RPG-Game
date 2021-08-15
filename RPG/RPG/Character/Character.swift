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
    var attackDirection = Direction.S
    
    
    // Status //
    var sp = CGFloat()
    
    // Move //
    var speedX = CGFloat()
    var speedY = CGFloat()
    
    // Mode //
    var moveDelayIs: Bool = false
    var attackDelayIs: Bool = false
    var skillDelayIs: Bool = false
    // Variable End
}
