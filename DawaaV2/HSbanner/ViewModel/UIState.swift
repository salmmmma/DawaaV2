//
//  UIStateBanner.swift
//  DawaaV2
//
//  Created by Mohammed Hassanien on 14/05/2026.
//

import Foundation
enum UIState<T> {
    case idle  
    case loading
    case success(T)
    case error(String)
}
