//
//  Meteor.swift
//  RPG
//
//  Created by 이서준 on 2021/08/11.
//

import SpriteKit
import GameplayKit

extension Character {
    func attackMeteor() {
        let positions: [CGPoint] = [
            CGPoint(x: 0, y: 200),
            CGPoint(x: 150, y: 100),
            CGPoint(x: -150, y: 100),
            CGPoint(x: 100, y: 0),
            CGPoint(x: 200, y: 200),
            CGPoint(x: 0, y: -200),
            CGPoint(x: 150, y: -100),
            CGPoint(x: -150, y: -100),
            CGPoint(x: -100, y: -0),
            CGPoint(x: -200, y: -0)
        ]
        
        for i in 0 ..< positions.count {
            let attackBody = Character(imageNamed: "Meteor1")
            attackBody.position = CGPoint(x: position.x + positions[i].x, y: position.y + positions[i].y)
            attackBody.zPosition = 1
            attackBody.alpha = 0
            
            sharedScene.addChild(attackBody)
            
            /// Meteor Fall Animations..
            let fadeInAction = SKAction.fadeIn(withDuration: 1.5)
            let fallAction = SKAction.run { attackBody.run(SKAction(named: "Attack_Meteor")!)}
            let waitAction = SKAction.wait(forDuration: 0.3)
            /// Meteor 스킬에 의한 화면 흔들림 애니메이션
            let shakeAction = SKAction.run { attackBody.attackMeteorAnimation() }
            let removeAction = SKAction.run { attackBody.removeFromParent() }
            attackBody.run(SKAction.sequence([fadeInAction, fallAction, waitAction, shakeAction, removeAction]))
        }
    }
    
    func attackMeteorAnimation() {
        let shakeX1 = SKAction.move(by: CGVector.init(dx: -3, dy: 0), duration: 0.05)
        let shakeX2 = SKAction.move(by: CGVector.init(dx: 3, dy: 0), duration: 0.05)
        let shakeX3 = SKAction.move(by: CGVector.init(dx: -3, dy: 0), duration: 0.05)
        let shakeX4 = SKAction.move(by: CGVector.init(dx: 3, dy: 0), duration: 0.05)
        
        let shakeY1 = SKAction.move(by: CGVector.init(dx: 0, dy: -3), duration: 0.05)
        let shakeY2 = SKAction.move(by: CGVector.init(dx: 0, dy: 3), duration: 0.05)
        let shakeY3 = SKAction.move(by: CGVector.init(dx: 0, dy: -3), duration: 0.05)
        let shakeY4 = SKAction.move(by: CGVector.init(dx: 0, dy: 3), duration: 0.05)
        
        localCamera.run(SKAction.sequence([shakeX1, shakeX2, shakeX3, shakeX4]))
        localCamera.run(SKAction.sequence([shakeY1, shakeY2, shakeY3, shakeY4]))
    }
}
