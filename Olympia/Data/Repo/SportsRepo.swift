//
//  SportsRepo.swift
//  Olympia
//
//  Created by Ahmed Morsy on 4/18/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

import Foundation

protocol SportsRepo {
    
    typealias WebServiceResponse<T> = (T?, Error?) -> Void
    
    func getSports(completion: @escaping WebServiceResponse<Sports>)
    
}
