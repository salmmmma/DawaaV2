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
        
        AF.request(BannerRouter.getBanners(ids: ids))
            .validate()
            .responseDecodable(of: BannerResponse.self) { response in
                switch response.result {
                case .success(let bannerResponse):
                    let banners = bannerResponse.components.compactMap { $0.component }
                    completion(.success(banners))
                    
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    
}
