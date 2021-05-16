//
//  FavouritesPresenter.swift
//  Olympia
//
//  Created by Ahmed Morsy on 4/18/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

import Foundation

protocol FavouritesPresenter {
    
    func getFavouriteLeagues()
    
    func addFavouriteLeague(league: League)
    
    func removeFavouriteLeague(league: League)
    
}
