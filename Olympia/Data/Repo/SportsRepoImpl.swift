//
//  SportsRepoImpl.swift
//  Olympia
//
//  Created by Ahmed Morsy on 4/27/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

class SportsRepoImpl: SportsRepo {
    private let remoteDataSource: RemoteDataSource
    
    init(remoteDataSource: RemoteDataSource){
        self.remoteDataSource = remoteDataSource
    }
    
    func getSports(completion: @escaping WebServiceResponse<Sports>) {
        remoteDataSource.fetchSports(completion: completion)
    }
}
