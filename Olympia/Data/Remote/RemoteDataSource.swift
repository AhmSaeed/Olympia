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
    
    func fetchUpcomingEvents(completion: @escaping WebServiceResponse<SportEvents>)
    
    func fetchLastResults(completion: @escaping WebServiceResponse<SportEvents>)
    
    func fetchTeamsByLeague(completion: @escaping WebServiceResponse<Teams>)
}
