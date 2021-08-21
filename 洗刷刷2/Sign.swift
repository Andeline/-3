//
//  Sign.swift
//  洗刷刷2
//
//  Created by 蔡佳穎 on 2021/8/19.
//

import Foundation

func randomSign() -> Sign {
    let sign = Int.random(in: 1...5)
    
    if sign == 1 {
        return .one
    } else if sign == 2 {
        return .two
    } else if sign == 3 {
        return .three
    } else if sign == 4 {
        return .four
    } else {
        return .five
    }
}

enum Sign: String {
    case one
    case two
    case three
    case four
    case five
    
    var image: String {
        switch self {
        case .one:
            return Sign.one.rawValue
        case .two:
            return Sign.two.rawValue
        case .three:
            return Sign.three.rawValue
        case .four:
            return Sign.four.rawValue
        case .five:
            return Sign.five.rawValue
        }
    }
    
    func gameState(against opponentSign: Sign) -> GameState {
        
        switch self {
        case .one:
            if opponentSign == .five {
                return .win
            } else if opponentSign == .two {
                return .lose
            }
        case .two:
            if opponentSign == .one {
                return .win
            } else if opponentSign == .three {
                return .lose
            }
        case .three:
            if opponentSign == .two {
                return .win
            } else if opponentSign == .four {
                return .lose
            }
        case .four:
            if opponentSign == .three {
                return .win
            } else if opponentSign == .five {
                return .lose
            }
        case .five:
            if opponentSign == .four {
                return .win
            } else if opponentSign == .one {
                return .lose
            }
        }
        return .draw
    }
}


