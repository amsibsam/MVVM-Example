//
//  GameScoreboardEditorViewModel.swift
//  MVVMSwiftExample
//
//  Created by MTMAC16 on 06/09/18.
//  Copyright © 2018 Toptal. All rights reserved.
//

import Foundation

protocol GameScoreboardEditorViewModel {
    var homeTeam: String { get }
    var awayTeam: String { get }
    var time: String { get }
    var score: String { get }
    var isFinished: Bool { get }
    var isPaused: Bool { get }
    var homePlayers: [PlayerScoreboardMoveEditorViewModel] { get }
    var awayPlayers: [PlayerScoreboardMoveEditorViewModel] { get }
    func togglePause()
}
