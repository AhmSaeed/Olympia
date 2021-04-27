//
//  File.swift
//  Olympia
//
//  Created by Ahmed Morsy on 4/25/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

import Foundation

extension DateFormatter {
    static func getdMMMy(date: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let date = formatter.date(from: date) else {return "Unknown date"}
        formatter.dateFormat = "d MMM yyyy"
        return formatter.string(from: date)
    }
    
    static func gethhmma(time: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        guard let time = formatter.date(from: time) else {return "Unknown time"}
        formatter.dateFormat = "hh:mm a"
        return formatter.string(from: time)
    }
    
    static func getdMMMhhmma(timeStamp: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let timeStamp = formatter.date(from: timeStamp) else {return "Unknown time"}
        formatter.dateFormat = "d MMM, hh:mm a"
        return formatter.string(from: timeStamp)
    }
}
