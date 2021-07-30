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
            
            controlBase.position = location
            controlBall.position = controlBase.position
            
            //touchPoint = location
            
            //해당포지션으로 이동
            //player.position = CGPoint(x: location.x, y: location.y)
            
            /// 걷는 모션을 위한 액션
            //let walkAction = SKAction.move(to: location, duration: 5)
            
            // 플레이어는 walkAction 실행
            //player.run(walkAction)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in (touches) {
            let location = touch.location(in: self)
            /// 삼각형을 구하는 산수
            let deltaX = location.x - controlBase.position.x
            let deltaY = location.y - controlBall.position.y
            /// 밑변/윗변
            let angle = atan2(deltaY, deltaX)
            
            let length = controlBase.frame.size.height / 2
            let distanceX = cos(angle) * length
            let distanceY = sin(angle) * length
            
            if controlBase.frame.contains(location) {
                // 컨트롤볼안에서의 터치가 이루어지면 컨트롤볼이 움직이게 됨
                controlBall.position = location
            } else {
                // 컨트롤볼이 컨트롤 베이스를 넘어서지 못하게 함
                controlBall.position = CGPoint(x: controlBase.position.x + distanceX, y: controlBase.position.y + distanceY)
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for _ in (touches) {
            //let location = touch.location(in: self)
            
            let moveCenterAction = SKAction.move(to: controlBase.position, duration: 0.2)
            // 컨트롤볼에 대한 터치가 끝났을 때, 0.2초동안 easeOut의 애니메이션으로
            moveCenterAction.timingMode = .easeOut
            // 컨트롤볼이 제자리로 돌아오게 됨
            controlBall.run(moveCenterAction)
        }
    }
    // Touch_ End
}
