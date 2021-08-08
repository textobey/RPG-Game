//
//  Melee.swift
//  RPG
//
//  Created by 이서준 on 2021/08/08.
//

import SpriteKit
import GameplayKit

extension Character {
    // 근접공격
    func attackMelee() {
        let attackBody = Character(imageNamed: "Attack_MeleeE1")
        attackBody.zPosition = 1
        self.addChild(attackBody)
        attackMeleeAnimation(attackBody: attackBody)
        // Action.sks에서 지정한 0.2초간의 애니메이션후에 0.2초간 기다린후에 공격 애니메이션을 지움
        let waitAction = SKAction.wait(forDuration: 0.2)
        let removeAction = SKAction.run { attackBody.removeFromParent() }
        // 시퀀스 배열로 지정해야 위의 애니메이션의 순차지정이 부드러움
        attackBody.run(SKAction.sequence([waitAction, removeAction]))
    }
    // 케릭터의 동서남북 근접 공격 애니메이션 실행
    func attackMeleeAnimation(attackBody: Character) {
        if self.attackDirection == .E {
            attackBody.position = CGPoint(x: 15, y: -12)
            attackBody.run(SKAction(named: "Attack_MeleeE")!)
        } else if self.attackDirection == .W {
            attackBody.position = CGPoint(x: -15, y: -12)
            attackBody.run(SKAction(named: "Attack_MeleeW")!)
        } else if self.attackDirection == .S {
            attackBody.position = CGPoint(x: -15, y: -12)
            attackBody.run(SKAction(named: "Attack_MeleeS")!)
        } else if self.attackDirection == .N {
            attackBody.position = CGPoint(x: -15, y: 12)
            attackBody.run(SKAction(named: "Attack_MeleeN")!)
        }
    }
}
