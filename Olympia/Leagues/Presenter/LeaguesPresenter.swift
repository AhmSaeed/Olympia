//
//  LeaguePresenter.swift
//  Olympia
//
//  Created by Ahmed Morsy on 4/27/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

import Foundation

protocol LeaguesPresenter {
    
    func getLeagues(by sportName: String)
    
    func addFavouriteLeague(league: League)
    
    func removeFavouriteLeague(league: League)
    
}
