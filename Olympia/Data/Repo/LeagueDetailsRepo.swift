//
//  LeagueDetailsRepo.swift
//  Olympia
//
//  Created by Ahmed Morsy on 4/24/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

import Foundation

protocol LeagueDetailsRepo {
    
    typealias WebServiceResponse<T> = (T?, Error?) -> Void
    
    func getUpcomingEvents(completion: @escaping WebServiceResponse<SportEvents>)
    
    func getLastResults(completion: @escaping WebServiceResponse<SportEvents>)
    
    func getTeamsByLeague(completion: @escaping WebServiceResponse<Teams>)
    
}
