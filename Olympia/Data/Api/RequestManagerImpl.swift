//
//  RequestManager.swift
//  Olympia
//
//  Created by Ahmed Morsy on 5/2/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

import Foundation
import Alamofire

typealias ResponseHandler<T: Codable> = (Result<T, Error>) -> ()

protocol RequestHandler {
    func get<T: Codable>(url: String, completion: @escaping ResponseHandler<T>)
}

class RequestManagerImpl: RequestHandler {

    static let shared = RequestManagerImpl()
    private init() {}
    
    func get<T: Codable>(url: String, completion: @escaping ResponseHandler<T>) {
        
        AF.request(url, method: .get).responseDecodable(of: T.self) { response in
//            switch response.result {
//                case .success:
//                    switch response.response?.statusCode {
//                        case 200:
//                            completion(Response.success(response.value!))
//                        case 300...308:
//                            completion(Response.failure("Request error")
//                    }
//                case let .failure(error):
//                    <#code#>
//                }
        }
    }
}
