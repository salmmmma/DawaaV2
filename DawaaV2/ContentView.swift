//
//  ContentView.swift
//  DawaaV2
//
//  Created by Mohammed Hassanien on 14/05/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                BannerHomeView()
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
