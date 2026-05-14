//
//  BannerViewModel.swift
//  DawaaV2
//
//  Created by Mohammed Hassanien on 14/05/2026.
//

import Foundation
import Combine

@MainActor
class BannerViewModel: ObservableObject {
    
    
    @Published var state: UIState<[BannerComponent]> = .idle
    
    private let repository: BannerRepositoryProtocol
        init(repository: BannerRepositoryProtocol = BannerRepository()) {
        self.repository = repository
    }
    
    func fetchBanners(ids: [String]) {
        self.state = .loading
        repository.getBanner(ids: ids) { [weak self] result in
            Task { @MainActor in
                switch result {
                case .success(let banners):
                    self?.state = .success(banners)
                case .failure(let error):
                    self?.state = .error(error.localizedDescription)
                }
            }
        }
    }
}
