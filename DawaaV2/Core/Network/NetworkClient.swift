//
//  NetworkClient.swift
//  DawaaV2
//
//  Created by Mohammed Hassanien on 14/05/2026.
//

import Foundation
import Alamofire

class NetworkClient {
    
    static func performRequest<T : Decodable>(route: URLRequestConfiguration, completion: @escaping (Result<T, AFError>) -> Void)
    {
        AF.request(route)
                    .validate()
                    .responseDecodable(of: T.self) { response in
                        completion(response.result)
                    }
            }
        }
