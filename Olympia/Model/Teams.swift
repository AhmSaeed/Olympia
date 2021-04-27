//
//  Teams.swift
//  Olympia
//
//  Created by Ahmed Morsy on 4/26/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

import Foundation

struct Teams : Codable {
    let teams : [Team]?

    enum CodingKeys: String, CodingKey {

        case teams = "teams"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        teams = try values.decodeIfPresent([Team].self, forKey: .teams)
    }

}
