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
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .getBanners(let ids):
            return [
                URLQueryItem(name: "componentIds", value: ids.joined(separator: ",")),
                URLQueryItem(name: "fields", value: "FULL"),
                URLQueryItem(name: "lang", value: "en")
            ]
        }
    }
    
    var parameters: Parameters? {
        return nil
    }
}
