//
//  FavouritesRepo.swift
//  Olympia
//
//  Created by Ahmed Morsy on 4/30/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

import Foundation
import CoreData

protocol FavouritesRepo {
    func getFavouriteLeagues() -> [NSManagedObject]
    
    func addFavouriteLeague(league: League)
    
    func removeFavouriteLeague(league: League)
}
