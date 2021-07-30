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
    
    /// 터치포인트
    //var touchPoint = CGPoint()
    
    /// 플레이어
    let player = SKSpriteNode(imageNamed: "RedSwan")
    /// 컨트롤베이스
    let controlBase = SKSpriteNode(imageNamed: "ControlBase")
    /// 컨트롤볼
    let controlBall = SKSpriteNode(imageNamed: "ControlBall")
        
    override func didMove(to view: SKView) {
        
        // Controller //
        
        // 컨트롤 베이스의 위치 지정과 scene에서의 우선 순위를 지정함, 추가로 player와 겹쳐 표시될때를 고려하여 alpha값 부여
        controlBase.position = CGPoint(x: -500, y: -200)
        controlBase.zPosition = 100
        controlBase.alpha = 0.5
        self.addChild(controlBase)
        
        controlBall.position = controlBase.position
        controlBall.zPosition = controlBase.zPosition
        controlBall.alpha = controlBase.alpha
        self.addChild(controlBall)
        
        // 컨트롤관련 UI보다 위에 위치 하지 않도록함
        player.zPosition = 10
        player.position = controlBase.position
        addChild(player)
    }
}
