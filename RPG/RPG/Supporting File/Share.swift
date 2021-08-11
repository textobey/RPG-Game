//
//  Share.swift
//  RPG
//
//  Created by 이서준 on 2021/08/01.
//

import Foundation
import SpriteKit

// MARK: - Variable
var sharedScene = GameScene()
let localCamera = SKCameraNode()
// End Variable

// MARK: - Enumeration
// Direction //
enum Direction {
    case E, W, S, N, ST
}

// End Enumeration
