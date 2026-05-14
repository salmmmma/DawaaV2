//
//  BannerRouter.swift
//  DawaaV2
//
//  Created by Mohammed Hassanien on 14/05/2026.
//
import Foundation
import Alamofire

enum BannerRouter: URLRequestConfiguration {
    
    case getBanners(ids: [String])
    
    var baseURL: String {
        return APIConfig.basePath
    }

    var method: HTTPMethod {
        switch self {
        case .getBanners:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getBanners:
            return "/occ/v2/aldawaa/cms/components/ids"
        }
    }
    
    var parameters: Parameters? {
        return nil
    }

    var headers: HTTPHeaders {
        return [:]
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .getBanners(let ids):
            let formattedIds = ids.joined(separator: ",")
            return [
                URLQueryItem(name: "componentIds", value: formattedIds),
                URLQueryItem(name: "fields", value: "FULL"),
                URLQueryItem(name: "lang", value: "en")
            ]
        }
    }
}
