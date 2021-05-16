//
//  LeagueDetailsRepo.swift
//  Olympia
//
//  Created by Ahmed Morsy on 4/24/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

import CoreData

protocol LeagueDetailsRepo {
    
    typealias WebServiceResponse<T> = (T?, Error?) -> Void
    
    func getUpcomingEvents(leagueId: String, round: String, completion: @escaping WebServiceResponse<SportEvents>)
    
    func getLastResults(leagueId: String, completion: @escaping WebServiceResponse<SportEvents>)
    
    func getTeamsByLeague(leagueName: String, completion: @escaping WebServiceResponse<Teams>)
    
    func isExistInFavourites(league: League) -> Bool
    
}
