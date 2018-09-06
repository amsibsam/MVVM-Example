//
//  GameScoreboardEditorViewModelImplementation.swift
//  MVVMSwiftExample
//
//  Created by MTMAC16 on 06/09/18.
//  Copyright © 2018 Toptal. All rights reserved.
//

import Foundation

class GameScoreboardEditorViewControllerImplementation: GameScoreboardEditorViewModel {
    
    let game: Game
    
    var homePlayers: [PlayerScoreboardMoveEditorViewModel]
    
    var awayPlayers: [PlayerScoreboardMoveEditorViewModel]
    
    var homeTeam: String
    
    var awayTeam: String
    
    var time: String
    
    var score: String
    
    var isFinished: Bool
    
    var isPaused: Bool
    
    func togglePause() {
        if isPaused {
            startTimer()
        } else {
            pauseTimer()
        }
        
        self.isPaused = !isPaused
    }
    
    init(withGame game: Game) {
        self.game = game
        
        self.homeTeam = game.homeTeam.name
        self.awayTeam = game.awayTeam.name
        self.time = GameScoreboardEditorViewControllerImplementation.timeRemainingPretty(for: game)
        self.score = GameScoreboardEditorViewControllerImplementation.scorePretty(for: game)
        self.isFinished = game.isFinished
        self.isPaused = true
        self.homePlayers = GameScoreboardEditorViewControllerImplementation.playerViewModels(from: game.homeTeam.players, game: game)
        self.awayPlayers = GameScoreboardEditorViewControllerImplementation.playerViewModels(from: game.awayTeam.players, game: game)
    }
    
    fileprivate var gameTimer: Timer?
    fileprivate func startTimer() {
        let interval: TimeInterval = 0.001
        gameTimer = Timer.schedule(repeatInterval: interval, handler: { timer in
//            if let gameVM = self {
                self.game.time += interval
//                guard let currentGame = self.game else { return }
                self.time = GameScoreboardEditorViewControllerImplementation.timeRemainingPretty(for: self.game)
//            }
        })
    }
    
    fileprivate func pauseTimer() {
        gameTimer?.invalidate()
        gameTimer = nil
    }
    
    fileprivate static func timeFormatted(totalMillis: Int) -> String {
        let millis: Int = totalMillis % 1000 / 100
        let totalSeconds: Int = totalMillis / 1000
        
        let seconds: Int = totalMillis % 60
        let minutes: Int = totalSeconds / 60
        
        return String(format: "%02d:%02d.%d", minutes, seconds, millis)
    }
    
    fileprivate static func timeRemainingPretty(for game: Game) -> String {
        return timeFormatted(totalMillis: Int(game.time * 1000))
    }
    
    fileprivate static func scorePretty(for game: Game) -> String {
        return String(format: "\(game.homeTeamScore) - \(game.awayTeamScore)")
    }
    
    fileprivate static func playerViewModels(from players: [Player], game: Game) -> [PlayerScoreboardMoveEditorViewModel] {
        var playerViewModels: [PlayerScoreboardMoveEditorViewModel] = [PlayerScoreboardMoveEditorViewModel]()
        for player in players {
            playerViewModels.append(PlayerScoreboardMoveEditorViewModelImplementation(player: player, game: game))
        }
        
        return playerViewModels
    }
}
