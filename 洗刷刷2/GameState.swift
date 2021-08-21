//
//  GameState.swift
//  洗刷刷2
//
//  Created by 蔡佳穎 on 2021/8/19.
//

import Foundation

enum GameState: String {
    case start
    case win
    case lose
    case draw
    
    var status: String {
        switch self {
        case .start:
            return "Ready?"
        case .win:
            return "You Won!"
        case .lose:
            return "You Lose"
        case .draw:
            return "It's a Draw"
        }
    }
}
