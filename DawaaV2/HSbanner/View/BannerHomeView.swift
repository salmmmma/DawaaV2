//
//  BannerHomeView.swift
//  DawaaV2
//
//  Created by Mohammed Hassanien on 14/05/2026.
//


struct BannerHomeView: View {
    @StateObject private var viewModel = BannerViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("العروض المميزة")
                .font(.title2)
                .bold()
                .padding(.leading)
            
            switch viewModel.state {
            case .idle:
                Color.clear.onAppear {
                    viewModel.fetchBanners(ids: ["1", "2", "3"])
                }
                
            case .loading:
                HStack {
                    Spacer()
                    ProgressView()
                    Spacer()
                }
                .frame(height: 200)
                
            case .success(let banners):
                // الـ Horizontal Scroll مع ميزة الـ Paging
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(banners, id: \.uid) { banner in
                            BannerItemView(banner: banner)
                                .containerRelativeFrame(.horizontal) // بيخلي البنر ياخد عرض الشاشة
                        }
                    }
                    .scrollTargetLayout() // ضروري عشان الـ Paging يشتغل
                }
                .scrollTargetBehavior(.paging) // بيخلي السكرول يقلب بنر بنر
                .frame(height: 200)
                
            case .error(let message):
                Text(message)
                    .foregroundColor(.red)
                    .padding()
            }
        }
    }
}