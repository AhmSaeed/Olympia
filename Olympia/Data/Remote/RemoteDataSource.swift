//
//  RemoteDataSource.swift
//  Olympia
//
//  Created by Ahmed Morsy on 4/18/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

import Foundation

protocol RemoteDataSource {
    
    typealias WebServiceResponse<T> = (T?, Error?) -> Void
    
    func fetchSports(completion: @escaping WebServiceResponse<Sports>)
    
    func fetchLeagues(by sportName: String, completion: @escaping WebServiceResponse<Leagues>)
    
    func fetchUpcomingEvents(by leagueId: String, and round: String, completion: @escaping WebServiceResponse<SportEvents>)
    
    func fetchLastResults(by leagueId: String, completion: @escaping WebServiceResponse<SportEvents>)
    
    func fetchTeams(by leagueName: String, completion: @escaping WebServiceResponse<Teams>)
}
