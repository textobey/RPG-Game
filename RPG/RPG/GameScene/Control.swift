//
//  Control.swift
//  RPG
//
//  Created by 이서준 on 2021/07/19.
//

import SpriteKit
import GameplayKit

extension GameScene {
    // MARK: - Touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in (touches) {
            /// 터치된 위치
            let location = touch.location(in: self)
            
            touchPoint = location
            
            //해당포지션으로 이동
            //player.position = CGPoint(x: location.x, y: location.y)
            
            /// 걷는 모션을 위한 액션
            //let walkAction = SKAction.move(to: location, duration: 5)
            
            // 플레이어는 walkAction 실행
            //player.run(walkAction)
        }
    }
    // Touch_ End
}
