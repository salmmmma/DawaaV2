//
//  BannerHomeView.swift
//  DawaaV2
//
//  Created by Mohammed Hassanien on 14/05/2026.
//


import SwiftUI

struct BannerHomeView: View {

    @StateObject private var viewModel = BannerViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {

            Text("Top Offers")
                .font(.title3)
                .bold()
                .padding(.horizontal)

            switch viewModel.state {

            case .idle:
                Color.clear
                    .frame(height: 200)
                    .onAppear {
                        viewModel.fetchBanners(ids: Constants.BannerIDs.homePage)
                    }

            case .loading:
                HStack {
                    Spacer()
                    ProgressView("Loading...")
                    Spacer()
                }
                .frame(height: 200)

            case .success(let banners):
                if banners.isEmpty {
                    Text("No offers available")
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, minHeight: 120)
                } else {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(banners, id: \.uid) { banner in
                                BannerItemView(banner: banner)
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                }

            case .error(let message):
                VStack(spacing: 10) {
                    Image(systemName: "exclamationmark.icloud")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                    Text(message)
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                    Button("Retry") {
                        viewModel.fetchBanners(ids: Constants.BannerIDs.homePage)
                    }
                    .buttonStyle(.bordered)
                }
                .frame(maxWidth: .infinity, minHeight: 200)
            }
        }
        .padding(.vertical)
    }
}

#Preview {
    BannerHomeView()
}
