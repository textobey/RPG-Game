//
//  GameScene.swift
//  RPG
//
//  Created by 이서준 on 2021/07/19.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    // SKSpriteNode: 게임에서 볼수있는 가장 중요한 요소(케릭터, 나무, 돌, 집, 드롭템 등)
    
    /// 플레이어
    let player = SKSpriteNode(imageNamed: "RedSwan")
    
    /// 터치포인트
    var touchPoint = CGPoint()
        
    override func didMove(to view: SKView) {
        addChild(player)
    }
}
