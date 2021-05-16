//
//  FavouritesRepoImpl.swift
//  Olympia
//
//  Created by Ahmed Morsy on 4/30/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

import Foundation
import CoreData

class FavouritesRepoImpl: FavouritesRepo {
    private let localDataSource: LocalDataSource
    
    init(localDataSource: LocalDataSource){
        self.localDataSource = localDataSource
    }
    
    func getFavouriteLeagues() -> [NSManagedObject] {
        return localDataSource.getFavouriteLeagues()
    }
    
    func addFavouriteLeague(league: League) {
        return localDataSource.addFavouriteLeague(league: league)
    }
    
    func removeFavouriteLeague(league: League) {
        return localDataSource.removeFavouriteLeague(league: league)
    }
}
