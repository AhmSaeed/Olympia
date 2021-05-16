//
//  LeaguesRepo.swift
//  Olympia
//
//  Created by Ahmed Morsy on 4/27/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

import Foundation

import Foundation

protocol LeaguesRepo {
    
    typealias WebServiceResponse<T> = (T?, Error?) -> Void
    
    func getLeagues(sportName: String, completion: @escaping WebServiceResponse<Leagues>)
    
    func addFavouriteLeague(league: League)
    
    func removeFavouriteLeague(league: League)
    
}
