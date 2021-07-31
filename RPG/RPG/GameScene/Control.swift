//
//  Control.swift
//  RPG
//
//  Created by 이서준 on 2021/07/19.
//

import SpriteKit
import GameplayKit

extension GameScene {
    // MARK: - Control Ball Angle
    func controlBallAngle(degree: CGFloat) {
        // 4방향 지원과 8방향을 지원하는 게임은 준비해야하는 분량이 차이가 크다
        if degree >= -45 && degree < 45 {
            print("player's current direction is EAST")
        } else if degree >= 45 && degree < 135 {
            print("player's current direction is NORTH")
        } else if degree >= 135 && degree < 180 {
            print("player's current direction is WEST")
        } else if degree >= -180 && degree < -135 {
            print("player's current direction is WEST")
        } else if degree >= -135 && degree < -45 {
            print("player's current direction is SOUTH")
        }
    }
    
    // Control Ball Angle_End
    
    // MARK: - Touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in (touches) {
            /// 터치된 위치
            let location = touch.location(in: self)
            
            if location.x < 0 {
                controlBase.position = location
                controlBall.position = controlBase.position
            } else {
                if attackButtonBase.frame.contains(location) {
                    print("Attack!")
                } else if itemButton.frame.contains(location) {
                    print("Item!")
                } else if skillButton.frame.contains(location) {
                    print("Skill!")
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in (touches) {
            let location = touch.location(in: self)
            
            if location.x < 0 {
                /// 삼각형을 구하는 산수
                let deltaX = location.x - controlBase.position.x
                let deltaY = location.y - controlBall.position.y
                /// 밑변/윗변
                let angle = atan2(deltaY, deltaX)
                let degree = angle * CGFloat(180 / Double.pi)
                controlBallAngle(degree: degree)
                
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
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in (touches) {
            let location = touch.location(in: self)
            
            if location.x < 0 {
                let moveCenterAction = SKAction.move(to: controlBase.position, duration: 0.2)
                // 컨트롤볼에 대한 터치가 끝났을 때, 0.2초동안 easeOut의 애니메이션으로
                moveCenterAction.timingMode = .easeOut
                // 컨트롤볼이 제자리로 돌아오게 됨
                controlBall.run(moveCenterAction)
            }
        }
    }
    // Touch_ End
}
