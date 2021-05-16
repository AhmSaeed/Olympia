//
//  LeaguesRepoImpl.swift
//  Olympia
//
//  Created by Ahmed Morsy on 4/27/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

import Foundation

class LeaguesRepoImpl: LeaguesRepo {
    private let remoteDataSource: RemoteDataSource
    private let localDataSource: LocalDataSource
    
    init(remoteDataSource: RemoteDataSource, localDataSource: LocalDataSource){
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }
    
    func getLeagues(sportName: String, completion: @escaping WebServiceResponse<Leagues>) {
        remoteDataSource.fetchLeagues(by: sportName, completion: completion)
    }
    
    func addFavouriteLeague(league: League) {
        localDataSource.addFavouriteLeague(league: league)
    }
    
    func removeFavouriteLeague(league: League) {
        localDataSource.removeFavouriteLeague(league: league)
    }
}
