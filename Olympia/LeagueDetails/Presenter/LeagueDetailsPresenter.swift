//
//  LeagueDetailsPresenter.swift
//  Olympia
//
//  Created by Ahmed Morsy on 4/24/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

import Foundation

protocol LeagueDetailsPresenter {
    
    typealias WebServiceResponse<T> = (T?, Error?) -> Void
    
    func getUpcomingEvents()
    
    func getLastResults()
    
    func getTeamsByLeague()
    
}
