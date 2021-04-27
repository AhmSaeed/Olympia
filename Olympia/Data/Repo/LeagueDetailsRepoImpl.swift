//
//  LeagueDetailsRepoImpl.swift
//  Olympia
//
//  Created by Ahmed Morsy on 4/24/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

import Foundation

class LeagueDetailsRepoImpl: LeagueDetailsRepo {
    private let remoteDataSource: RemoteDataSource
    
    init(remoteDataSource: RemoteDataSource){
        self.remoteDataSource = remoteDataSource
    }
    
    func getUpcomingEvents(completion: @escaping WebServiceResponse<SportEvents>) {
        remoteDataSource.fetchUpcomingEvents(completion: completion)
    }
    
    func getLastResults(completion: @escaping WebServiceResponse<SportEvents>) {
        remoteDataSource.fetchLastResults(completion: completion)
    }
    
    func getTeamsByLeague(completion: @escaping WebServiceResponse<Teams>) {
        remoteDataSource.fetchTeamsByLeague(completion: completion)
    }
}
