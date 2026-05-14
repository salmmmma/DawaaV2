//
//  URLRequestConfiguration.swift
//  DawaaV2
//
//  Created by Mohammed Hassanien on 14/05/2026.
//


import Foundation
import Alamofire

protocol URLRequestConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
    var queryItems: [URLQueryItem]? { get }
    var headers: HTTPHeaders { get }
}

extension URLRequestConfiguration {
    
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return "stgprevapi.al-dawaa.com"
    }
    
    var headers: HTTPHeaders {
        return [
            "Accept": "application/json",
            "Content-Type": "application/json"
        ]
    }
    
    func asURLRequest() throws -> URLRequest {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = queryItems
        
        guard let url = components.url else {
            throw AFError.parameterEncodingFailed(reason: .missingURL)
        }
        
        var request = URLRequest(url: url)
        request.method = method
        request.headers = headers
        
        if let parameters = parameters {
            request = try JSONEncoding.default.encode(request, with: parameters)
        }
        
        return request
    }
}