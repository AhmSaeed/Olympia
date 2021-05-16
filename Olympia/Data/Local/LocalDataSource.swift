//
//  LocalDataSource.swift
//  Olympia
//
//  Created by Ahmed Morsy on 4/18/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

import Foundation
import CoreData

protocol LocalDataSource {
    var favourites: [NSManagedObject] {get}
    
    func getFavouriteLeagues() -> [NSManagedObject]
    
    func addFavouriteLeague(league: League)
    
    func removeFavouriteLeague(league: League)
    
    func isExistInFavourites(league: League) -> Bool
}
