//
//  LocalDataSourceImpl.swift
//  Olympia
//
//  Created by Ahmed Morsy on 4/30/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

import Foundation
import CoreData

class LocalDataSourceImpl: LocalDataSource {
    
    var favourites: [NSManagedObject] {
        return CoreDataManager.shared.favourites
    }
    
    func getFavouriteLeagues() -> [NSManagedObject] {
        return favourites
    }
    
    func addFavouriteLeague(league: League) {
        CoreDataManager.shared.addFavourite(with: league)
    }
    
    func removeFavouriteLeague(league: League) {
        CoreDataManager.shared.removeFavourite(with: league)
    }
    
    func isExistInFavourites(league: League) -> Bool {
        CoreDataManager.shared.isExistInFavourites(item: league)
    }
}
