//
//  Data.swift
//  RPG
//
//  Created by 이서준 on 2021/08/15.
//

import SpriteKit
import GameplayKit

extension GameScene {
    // MARK: - Player
    // 플레이어 데이터베이스를 기반으로 플레이어 프로퍼티를 구성함.
    func dataPlayer() {
        let data = gameData["Player"] as! [String: Any]
        let sp = data["SP"] as! CGFloat
        
        player = Character(imageNamed: "RedSwan")
        player.sp = sp
        player.zPosition = 10
        self.addChild(player)
    }
    // Player_End
}
