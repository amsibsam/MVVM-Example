//
//  PlayerScoreboardMoveEditorViewModel.swift
//  MVVMSwiftExample
//
//  Created by MTMAC16 on 06/09/18.
//  Copyright © 2018 Toptal. All rights reserved.
//

import Foundation

protocol PlayerScoreboardMoveEditorViewModel {
    var playerName: String { get }
    var onePointMoveCount: Dynamic<String> { get }
    var twoPointMoveCount: Dynamic<String> { get }
    var assistMoveCount: Dynamic<String> { get }
    var reboundMoveCount: Dynamic<String> { get }
    var foulMoveCount: Dynamic<String> { get }
    
    func onePointMove()
    func twoPointMove()
    func assistMove()
    func reboundMove()
    func foulMove()
}
