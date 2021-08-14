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
                
                if currentDirection != lastDirection {
                    // Move에 대한 액션 삭제
                    removeAction(forKey: "Move")
                    // 각각에 방향을 보는 이미지로 설정
                    if lastDirection == Direction.E {
                        self.texture = SKTexture(imageNamed: "RedSwanMoveE1")
                    }
                    if lastDirection == Direction.W {
                        self.texture = SKTexture(imageNamed: "RedSwanMoveW1")
                    }
                    if lastDirection == Direction.S {
                        self.texture = SKTexture(imageNamed: "RedSwanMoveS1")
                    }
                    if lastDirection == Direction.N {
                        self.texture = SKTexture(imageNamed: "RedSwanMoveN1")
                    }
                    
                    attackDirection = lastDirection
                }
                lastDirection = currentDirection
            case .E:
                speedX = sp
                speedY = 0
                // East Direction로 움직일때 동일 방향에 대한 애니메이션은 한번만 재생해주기 위해
                if currentDirection != lastDirection {
                    let moveAtlas = SKTextureAtlas(named: "RedSwanMoveE")
                    var moveFrame: [SKTexture] = []
                    for i in 1 ... moveAtlas.textureNames.count / 2 {
                        let textureName = "RedSwanMoveE" + String(i)
                        moveFrame.append(moveAtlas.textureNamed(textureName))
                    }
                    let moveAnimationAction = SKAction.repeatForever(SKAction.animate(with: moveFrame, timePerFrame: 0.125))
                    self.run(moveAnimationAction, withKey: "Move")
                    attackDirection = lastDirection
                }
                lastDirection = currentDirection
            case .W:
                speedX = -sp
                speedY = 0
                if currentDirection != lastDirection {
                    let moveAtlas = SKTextureAtlas(named: "RedSwanMoveW")
                    var moveFrame: [SKTexture] = []
                    for i in 1 ... moveAtlas.textureNames.count / 2 {
                        let textureName = "RedSwanMoveW" + String(i)
                        moveFrame.append(moveAtlas.textureNamed(textureName))
                    }
                    let moveAnimationAction = SKAction.repeatForever(SKAction.animate(with: moveFrame, timePerFrame: 0.125))
                    self.run(moveAnimationAction, withKey: "Move")
                    attackDirection = lastDirection
                }
                lastDirection = currentDirection
            case .S:
                speedX = 0
                speedY = -sp
                if currentDirection != lastDirection {
                    let moveAtlas = SKTextureAtlas(named: "RedSwanMoveS")
                    var moveFrame: [SKTexture] = []
                    for i in 1 ... moveAtlas.textureNames.count / 2 {
                        let textureName = "RedSwanMoveS" + String(i)
                        moveFrame.append(moveAtlas.textureNamed(textureName))
                    }
                    let moveAnimationAction = SKAction.repeatForever(SKAction.animate(with: moveFrame, timePerFrame: 0.125))
                    self.run(moveAnimationAction, withKey: "Move")
                    attackDirection = lastDirection
                }
                lastDirection = currentDirection
            case .N:
                speedX = 0
                speedY = sp
                if currentDirection != lastDirection {
                    let moveAtlas = SKTextureAtlas(named: "RedSwanMoveN")
                    var moveFrame: [SKTexture] = []
                    for i in 1 ... moveAtlas.textureNames.count / 2 {
                        let textureName = "RedSwanMoveN" + String(i)
                        moveFrame.append(moveAtlas.textureNamed(textureName))
                    }
                    let moveAnimationAction = SKAction.repeatForever(SKAction.animate(with: moveFrame, timePerFrame: 0.125))
                    self.run(moveAnimationAction, withKey: "Move")
                    attackDirection = lastDirection
                }
                lastDirection = currentDirection
        }
        // moveDelay가 false인 상태인 경우에만 움직일수있도록 허용
        if moveDelayIs != true {
            self.position = CGPoint(x: self.position.x + speedX, y: self.position.y + speedY)
        }
    }
}
