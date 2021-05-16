//
//  Mapper.swift
//  Olympia
//
//  Created by Ahmed Morsy on 5/1/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

import CoreData

class Mapper {
    public static func nsManagedObjectToLeague(league: NSManagedObject) -> League {
        let league = League(
            idLeague: (league.value(forKey: "idLeague") as! String),
            strBadge: (league.value(forKey: "strBadge") as! String),
            strLeague: (league.value(forKey: "strLeague") as! String),
            strSport: (league.value(forKey: "strSport") as! String),
            strYoutube: (league.value(forKey: "strYoutube") as! String)
        )
        
        return league
    }
}
