//
//  Item.swift
//  RPG
//
//  Created by 이서준 on 2021/08/08.
//

import SpriteKit
import GameplayKit

extension Character {
    // 게임 아이템 사용
    func functionItem() {
        let itemBody = Character(imageNamed: "ItemButton")
        itemBody.zPosition = 1
        // 케릭터의 머리위에서 아이템 사용 효과를 나타내기 위한 작업
        itemBody.position = CGPoint(x: 0, y: self.size.height)
        itemBody.xScale = 0.7
        itemBody.yScale = 0.7
        
        self.addChild(itemBody)
        
        // Action //
        let fadeOutAction = SKAction.fadeOut(withDuration: 1)
        let removeAction = SKAction.run { itemBody.removeFromParent() }
        itemBody.run(SKAction.sequence([fadeOutAction, removeAction]))
    }
}
