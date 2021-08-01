//
//  Update.swift
//  RPG
//
//  Created by 이서준 on 2021/07/19.
//

import SpriteKit
import GameplayKit

extension GameScene {
    // MARK: - Update
    // update: 항상 실행이 되고 있는 부분
    override func update(_ currentTime: TimeInterval) {        
        print(player.currentDirection)
        player.function_move()
        /*
        // 플레이어의 현재 위치와 터치의 위치를 비교하여 플레이어가 비교적 부드럽게 움직이게 하는 로직
        if player.position.x < touchPoint.x - 5 {
            player.position.x = player.position.x + 5
        } else if player.position.x > touchPoint.x + 5 {
            player.position.x = player.position.x - 5
        }
        
        if player.position.y < touchPoint.y - 5 {
            player.position.y = player.position.y + 5
        } else if player.position.y > touchPoint.y + 5 {
            player.position.y = player.position.y - 5
        }
        */
    }
    // Update_End
}
