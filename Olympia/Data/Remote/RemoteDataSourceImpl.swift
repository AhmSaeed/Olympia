//
//  RemoteDataSourceImpl.swift
//  Olympia
//
//  Created by Ahmed Morsy on 4/24/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

import Foundation
import Alamofire

class RemoteDataSourceImpl: RemoteDataSource {
    
    func fetchSports(completion: @escaping WebServiceResponse<Sports>) {
        AF.request("https://www.thesportsdb.com/api/v1/json/1/all_sports.php").validate().responseDecodable(of: Sports.self) { (response) in
            if let error = response.error {
                completion(nil, error)
            } else if let sports = response.value {
                completion(sports, nil)
            }
        }
    }
    
    func fetchUpcomingEvents(completion: @escaping WebServiceResponse<SportEvents>) {
        AF.request("https://www.thesportsdb.com/api/v1/json/1/eventsround.php?id=4328&r=34&s=2020-2021").validate().responseDecodable(of: SportEvents.self) { (response) in
            if let error = response.error {
                completion(nil, error)
            } else if let events = response.value {
                completion(events, nil)
            }
        }
    }
    
    func fetchLastResults(completion: @escaping WebServiceResponse<SportEvents>) {
        AF.request("https://www.thesportsdb.com/api/v1/json/1/eventspastleague.php?id=4328").validate().responseDecodable(of: SportEvents.self) { (response) in
            if let error = response.error {
                completion(nil, error)
            } else if let events = response.value {
                completion(events, nil)
            }
        }
    }
    
    func fetchTeamsByLeague(completion: @escaping WebServiceResponse<Teams>) {
        AF.request("https://www.thesportsdb.com/api/v1/json/1/search_all_teams.php?l=English%20Premier%20League").validate().responseDecodable(of: Teams.self) { (response) in
            if let error = response.error {
                completion(nil, error)
            } else if let teams = response.value {
                completion(teams, nil)
            }
        }
    }
    
}
