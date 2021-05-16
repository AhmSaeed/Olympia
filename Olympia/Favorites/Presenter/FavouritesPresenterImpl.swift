//
//  FavouritesPresenterImpl.swift
//  Olympia
//
//  Created by Ahmed Morsy on 4/30/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

import Foundation

class FavouritesPresenterImpl: FavouritesPresenter {
    private let favouritesRepo: FavouritesRepo
    weak var favouritesViewController: FavouritesViewController?
    
    init(favouritesRepo: FavouritesRepo, favouritesViewController: FavouritesViewController){
        self.favouritesRepo = favouritesRepo
        self.favouritesViewController = favouritesViewController
    }
   
    func getFavouriteLeagues() {
        let leagues = favouritesRepo.getFavouriteLeagues()
        favouritesViewController?.displayLeagues(LeaguesArray: leagues)
    }
    
    
    func addFavouriteLeague(league: League) {
        favouritesRepo.addFavouriteLeague(league: league)
    }
    
    func removeFavouriteLeague(league: League) {
        print("Remove")
        favouritesRepo.removeFavouriteLeague(league: league)
    }
}
