//
//  LeaguesPresenter.swift
//  Olympia
//
//  Created by Ahmed Morsy on 4/18/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

import Foundation

class LeaguesPresenterImpl: LeaguesPresenter {
    private let leaguesRepo: LeaguesRepo
    weak var leaguesViewController: LeaguesViewController?
    
    init(leaguesRepo: LeaguesRepo, leaguesViewController: LeaguesViewController){
        self.leaguesRepo = leaguesRepo
        self.leaguesViewController = leaguesViewController
    }
   
    func getLeagues(by sportName: String) {
        if(Reachability.isConnectedToNetwork()) {
            leaguesRepo.getLeagues(sportName: sportName, completion: { result, error in
                self.leaguesViewController?.displayLeagues(LeaguesArray: result?.leagues ?? [])
            })
        } else {
            leaguesViewController?.showNoInternetAlert()
        }
    }
    
    
    func addFavouriteLeague(league: League) {
        leaguesRepo.addFavouriteLeague(league: league)
    }
    
    func removeFavouriteLeague(league: League) {
        leaguesRepo.removeFavouriteLeague(league: league)
    }
}

