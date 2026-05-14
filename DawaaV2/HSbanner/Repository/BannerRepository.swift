//
//  BannerRepository.swift
//  DawaaV2
//
//  Created by Mohammed Hassanien on 14/05/2026.
//

import Foundation
import Alamofire

final class BannerRepository:BannerRepositoryProtocol
{
    func getBanner(ids: [String], completion: @escaping (Result<[BannerComponent], any Error>) -> Void)
    {
        NetworkClient.performRequest(route: BannerRouter.getBanners(ids: ids)){ (result: Result<BannerResponse, AFError>) in
            switch result {
            case .success(let response):
                let banners = response.components.compactMap { $0.component }
                completion(.success(banners))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
    
