//
//  SportsPresenterImpl.swift
//  Olympia
//
//  Created by Ahmed Morsy on 4/27/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

import Foundation
class SportsPressenterImpl: SportsPresenter {
    let sportsRepo: SportsRepo
    
    init(sportsRepo: SportsRepo){
        self.sportsRepo = sportsRepo
        
    }
    
    func getSports(completion: @escaping WebServiceResponse<Sports>){
        sportsRepo.getSports(completion: completion)
    }
}
