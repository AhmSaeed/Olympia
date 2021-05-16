//
//  LeagueDetailsRepoImpl.swift
//  Olympia
//
//  Created by Ahmed Morsy on 4/24/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

import CoreData

class LeagueDetailsRepoImpl: LeagueDetailsRepo {
    private let remoteDataSource: RemoteDataSource
    private let localDataSource: LocalDataSource
    
    init(remoteDataSource: RemoteDataSource, localDataSource: LocalDataSource){
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }
    
    func getSports(completion: @escaping WebServiceResponse<Sports>) {
        remoteDataSource.fetchSports(completion: completion)
    }
    
    func getUpcomingEvents(leagueId: String, round: String, completion: @escaping WebServiceResponse<SportEvents>) {
        remoteDataSource.fetchUpcomingEvents(by: leagueId, and: round, completion: completion)
    }
    
    func getLastResults(leagueId: String, completion: @escaping WebServiceResponse<SportEvents>) {
        remoteDataSource.fetchLastResults(by: leagueId, completion: completion)
    }
    
    func getTeamsByLeague(leagueName: String, completion: @escaping WebServiceResponse<Teams>) {
        remoteDataSource.fetchTeams(by: leagueName, completion: completion)
    }
    
    func isExistInFavourites(league: League) -> Bool {
        localDataSource.isExistInFavourites(league: league)
    }
}
