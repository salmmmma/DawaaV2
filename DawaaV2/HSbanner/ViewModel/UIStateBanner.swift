//
//  UIStateBanner.swift
//  DawaaV2
//
//  Created by Mohammed Hassanien on 14/05/2026.
//

import Foundation
enum UIStateBanner
{
    case idel
    case loading
    case success([BannerComponent])
    case error(String)
}
