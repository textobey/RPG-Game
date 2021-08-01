//
//  Move.swift
//  RPG
//
//  Created by 이서준 on 2021/08/01.
//

import SpriteKit
import GameplayKit

extension Character {
    func function_move() {
            switch currentDirection {
            case .ST:
                speedX = 0
                speedY = 0
            case .E:
                speedX = sp
                speedY = 0
            case .W:
                speedX = -sp
                speedY = 0
            case .S:
                speedX = 0
                speedY = -sp
            case .N:
                speedX = 0
                speedY = sp
        }
        self.position = CGPoint(x: self.position.x + speedX, y: self.position.y + speedY)
    }
}
