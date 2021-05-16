//
//  Leagues.swift
//  Olympia
//
//  Created by Ahmed Morsy on 4/27/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

import Foundation

struct Leagues : Codable {
    let leagues : [League]?

    enum CodingKeys: String, CodingKey {

        case leagues = "countrys"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        leagues = try values.decodeIfPresent([League].self, forKey: .leagues)
    }

}
