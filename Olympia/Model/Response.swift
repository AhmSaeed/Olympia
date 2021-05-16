//
//  Response.swift
//  Olympia
//
//  Created by Ahmed Morsy on 5/2/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

import Foundation

enum Response<Success, Failure: Error>{
    case success(Success)
    case failure(Failure)
}
