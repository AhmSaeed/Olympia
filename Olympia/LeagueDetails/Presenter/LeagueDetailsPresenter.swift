//
//  LeagueDetailsPresenter.swift
//  Olympia
//
//  Created by Ahmed Morsy on 4/24/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

import CoreData

protocol LeagueDetailsPresenter {
    
    typealias WebServiceResponse<T> = (T?, Error?) -> Void
    
    func getUpcomingEvents(by leagueId: String, and round: String)
    
    func getLastResults(by leagueId: String)
    
    func getTeamsByLeague(by leagueName: String)
    
    func isExistInFavourites(league: League) -> Bool
    
}
