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
    
    // MARK: - Monster
    func dataMonster() {
        /// GameData.plist에 존재하는 monsterGroup dictionary
        let monsterGroupData = gameData["MonsterGroup"] as! [String: Any]
        /// monsterGroup dictionary의 value값만을 가져옴
        for (_, value) in monsterGroupData {
            let data = value as! [String: Any]
            let positionX = data["PositionX"] as! CGFloat
            let positionY = data["PositionY"] as! CGFloat
            let sp = data["SP"] as! CGFloat
            
            monster = Character(imageNamed: "Archer")
            monster.positionX = positionX
            monster.positionY = positionY
            monster.sp = sp
            monster.position = CGPoint(x: positionX, y: positionY)
            monster.zPosition = 10
            
            monsterGroup.append(monster)
            self.addChild(monster)
        }
    }
    // Monster_End
}
