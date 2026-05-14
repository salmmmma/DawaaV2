//
//  BannerItemView.swift
//  DawaaV2
//
//  Created by Mohammed Hassanien on 14/05/2026.
//

import SwiftUI

struct BannerItemView: View {
    let banner: BannerComponent

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            
            
            AsyncImage(url: URL(string: APIConfig.mediaBaseURL + (banner.media?.mobile?.url ?? ""))) { phase in
                switch phase {
                case .empty:
                    ZStack {
                        Color.gray.opacity(0.1)
                        ProgressView()
                    }
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .clipped()
                case .failure:
                    ZStack {
                        Color.gray.opacity(0.1)
                        VStack {
                            Image(systemName: "photo")
                                .font(.largeTitle)
                            Text("Failed to load image")
                                .font(.caption2)
                        }
                        .foregroundColor(.gray)
                    }
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width: 150, height: 50)
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}
