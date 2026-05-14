//
//  BannerRepositoryProtocol.swift
//  DawaaV2
//
//  Created by Mohammed Hassanien on 14/05/2026.
//

import Foundation
protocol BannerRepositoryProtocol
{
    func getBanner(ids: [String], completion: @escaping (Result<[BannerComponent], Error>)-> Void  )
}
