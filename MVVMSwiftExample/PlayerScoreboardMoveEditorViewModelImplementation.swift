//
//  PlayerScoreboardMoveEditorViewModelImplementation.swift
//  MVVMSwiftExample
//
//  Created by MTMAC16 on 06/09/18.
//  Copyright © 2018 Toptal. All rights reserved.
//

import Foundation

class PlayerScoreboardMoveEditorViewModelImplementation: PlayerScoreboardMoveEditorViewModel {
    let player: Player
    let game: Game
    
    var playerName: String
    
    var onePointMoveCount: Dynamic<String>
    
    var twoPointMoveCount: Dynamic<String>
    
    var assistMoveCount: Dynamic<String>
    
    var reboundMoveCount: Dynamic<String>
    
    var foulMoveCount: Dynamic<String>
    
    func onePointMove() {
        makeMove(.onePoint)
    }
    
    func twoPointMove() {
        makeMove(.twoPoints)
    }
    
    func assistMove() {
        makeMove(.assist)
    }
    
    func reboundMove() {
        makeMove(.rebound)
    }
    
    func foulMove() {
        makeMove(.foul)
    }
    
    init(player: Player, game: Game) {
        self.player = player
        self.game = game
        
        self.playerName = player.name
        self.onePointMoveCount = Dynamic("\(game.playerMoveCount(for: player, move: .onePoint))")
        self.twoPointMoveCount = Dynamic("\(game.playerMoveCount(for: player, move: .twoPoints))")
        self.assistMoveCount = Dynamic("\(game.playerMoveCount(for: player, move: .assist))")
        self.reboundMoveCount = Dynamic("\(game.playerMoveCount(for: player, move: .rebound))")
        self.foulMoveCount = Dynamic("\(game.playerMoveCount(for: player, move: .foul))")
    }
    
    fileprivate func makeMove(_ move: PlayerInGameMove) {
        onePointMoveCount.value = "\(game.playerMoveCount(for: player, move: .onePoint))"
        twoPointMoveCount.value = "\(game.playerMoveCount(for: player, move: .twoPoints))"
        assistMoveCount.value = "\(game.playerMoveCount(for: player, move: .assist))"
        reboundMoveCount.value = "\(game.playerMoveCount(for: player, move: .rebound))"
        foulMoveCount.value = "\(game.playerMoveCount(for: player, move: .foul))"
    }
}
