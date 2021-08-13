//
//  Delay.swift
//  RPG
//
//  Created by 이서준 on 2021/08/13.
//

import SpriteKit
import GameplayKit

extension Character {
    /// 버튼에 딜레이 이펙트 기능을 추가합니다.
    func functionDelayEffect(button: String, delay: CGFloat) {
        // Circle //
        let radius = CGFloat(46.6)
        // 원이나 사각형을 만들수있는 프로퍼티
        let circle = SKShapeNode(circleOfRadius: radius)
        circle.zPosition = 101
        circle.zRotation = CGFloat.pi / 2
        circle.fillColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.2)
        circle.strokeColor = UIColor.clear
        
        if button == "AttackButton" {
            circle.position = sharedScene.attackButton.position
        } else if button == "SkillButton" {
            circle.position = sharedScene.skillButton.position
        }
        sharedScene.addChild(circle)
        
        // Animation //
        // 원 360도를 1로 나눈다. 1도씩 줄어드는 효과의 추가를 위한 작업
        let step = Int(360)
        let interval = TimeInterval(delay) / TimeInterval(step)
        let increment = 1 / CGFloat(step)
        var percent = CGFloat(1.0)
        
        let delayAction = SKAction.run {
            percent -= increment
            
            // Shape //
            let startAngle = CGFloat(0)
            let endAngle = CGFloat.pi * 2 * percent
            let center = CGPoint.zero
            
            // 버튼에 지정해놓은 딜레이를 기준으로 원이 1도씩 줄어드는 애니메이션을 추가하여, 딜레이 애니메이션을 만듦
            let bezeirPath = UIBezierPath()
            bezeirPath.move(to: center)
            bezeirPath.addArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
            bezeirPath.addLine(to: center)
            
            circle.path = bezeirPath.cgPath
        }
        let waitAction = SKAction.wait(forDuration: interval)
        circle.run(SKAction.repeat(SKAction.sequence([delayAction, waitAction]), count: step - 1)) {
            circle.path = nil
            circle.removeFromParent()
        }
        
    }
}
