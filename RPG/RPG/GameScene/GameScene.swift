//
//  GameScene.swift
//  RPG
//
//  Created by 이서준 on 2021/07/19.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    // MARK: - Variable
    // SKSpriteNode: 게임에서 볼수있는 가장 중요한 요소(케릭터, 나무, 돌, 집, 드롭템 등)
    /// 게임데이터
    var gameData = NSMutableDictionary()
    /// 플레이어
    var player = Character()
    /// 컨트롤베이스
    let controlBase = SKSpriteNode(imageNamed: "ControlBase")
    /// 컨트롤볼
    let controlBall = SKSpriteNode(imageNamed: "ControlBall")
    /// 공격버튼
    let attackButtonBase = SKSpriteNode(imageNamed: "ButtonBase")
    let attackButton = SKSpriteNode(imageNamed: "AttackButton")
    /// 아이템버튼
    let itemButtonBase = SKSpriteNode(imageNamed: "ButtonBase")
    let itemButton = SKSpriteNode(imageNamed: "ItemButton")
    /// 스킬버튼
    let skillButtonBase = SKSpriteNode(imageNamed: "ButtonBase")
    let skillButton = SKSpriteNode(imageNamed: "SkillButton")
    
        
    override func didMove(to view: SKView) {
        sharedScene = self
        
        // Local Camera //
        self.camera = localCamera
        self.addChild(localCamera)
        
        // Data //
        let path = Bundle.main.path(forResource: "GameData", ofType: "plist")
        gameData = NSMutableDictionary(contentsOfFile: path!)!
        dataPlayer()
        
        // Controller //
        // 컨트롤 베이스의 위치 지정과 scene에서의 우선 순위를 지정함, 추가로 player와 겹쳐 표시될때를 고려하여 alpha값 부여
        controlBase.position = CGPoint(x: -500, y: -200)
        controlBase.zPosition = 100
        controlBase.alpha = 0.5
        self.addChild(controlBase)
        
        // 컨트롤볼
        controlBall.position = controlBase.position
        controlBall.zPosition = controlBase.zPosition
        controlBall.alpha = controlBase.alpha
        self.addChild(controlBall)
        
        attackButtonBase.position = CGPoint(x: 375, y: -125)
        attackButtonBase.zPosition = 99
        attackButtonBase.alpha = 0.5
        self.addChild(attackButtonBase)
        attackButton.position = CGPoint(x: 375, y: -125)
        attackButton.zPosition = 100
        attackButton.alpha = 1
        self.addChild(attackButton)
        
        itemButtonBase.position = CGPoint(x: 350, y: -300)
        itemButtonBase.zPosition = 99
        itemButtonBase.alpha = 0.5
        self.addChild(itemButtonBase)
        itemButton.position = CGPoint(x: 350, y: -300)
        itemButton.zPosition = 100
        itemButton.alpha = 1
        self.addChild(itemButton)
        
        skillButtonBase.position = CGPoint(x: 550, y: -200)
        skillButtonBase.zPosition = 99
        skillButtonBase.alpha = 0.5
        self.addChild(skillButtonBase)
        skillButton.position = CGPoint(x: 550, y: -200)
        skillButton.zPosition = 100
        skillButton.alpha = 1
        self.addChild(skillButton)
    }
}
