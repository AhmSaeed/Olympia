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
    
    func encodeURL(url: String) -> String? {
        return url.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
    }
    
    func fetchSports(completion: @escaping WebServiceResponse<Sports>) {
        AF.request("https://www.thesportsdb.com/api/v1/json/1/all_sports.php").validate().responseDecodable(of: Sports.self) { (response) in
            if let error = response.error {
                completion(nil, error)
            } else if let sports = response.value {
                completion(sports, nil)
            }
        }
    }
    
    func fetchLeagues(by sportName: String, completion: @escaping WebServiceResponse<Leagues>) {
        guard let encodedSportName = encodeURL(url: sportName) else { return }
        AF.request("https://www.thesportsdb.com/api/v1/json/1/search_all_leagues.php?s=\(encodedSportName)").validate().responseDecodable(of: Leagues.self) { (response) in
            if let error = response.error {
                completion(nil, error)
                print(error)
            } else if let leagues = response.value {
                completion(leagues, nil)
                print(leagues)
            }
        }
    }
    
    func fetchUpcomingEvents(by leagueId: String, and round: String, completion: @escaping WebServiceResponse<SportEvents>) {
        AF.request("https://www.thesportsdb.com/api/v1/json/1/eventsround.php?id=\(leagueId)&r=\(round)&s=2020-2021").validate().responseDecodable(of: SportEvents.self) { (response) in
            if let error = response.error {
                completion(nil, error)
            } else if let events = response.value {
                completion(events, nil)
            }
        }
    }
    
    func fetchLastResults(by leagueId: String, completion: @escaping WebServiceResponse<SportEvents>) {
        AF.request("https://www.thesportsdb.com/api/v1/json/1/eventspastleague.php?id=\(leagueId)").validate().responseDecodable(of: SportEvents.self) { (response) in
            if let error = response.error {
                completion(nil, error)
            } else if let events = response.value {
                completion(events, nil)
            }
        }
    }
    
    func fetchTeams(by leagueName: String, completion: @escaping WebServiceResponse<Teams>) {
        guard let encodedLeagueName = encodeURL(url: leagueName) else { return }
        AF.request("https://www.thesportsdb.com/api/v1/json/1/search_all_teams.php?l=\(encodedLeagueName)").validate().responseDecodable(of: Teams.self) { (response) in
            if let error = response.error {
                completion(nil, error)
            } else if let teams = response.value {
                completion(teams, nil)
            }
        }
    }
    
}
