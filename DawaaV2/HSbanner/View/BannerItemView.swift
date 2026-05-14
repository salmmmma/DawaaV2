struct BannerItemView: View {
    let banner: BannerComponent
    
    var body: some View {
        AsyncImage(url: URL(string: banner.imageURL ?? "")) { phase in
            switch phase {
            case .empty:
                // حالة التحميل
                ZStack {
                    Color.gray.opacity(0.2)
                    ProgressView()
                }
            case .success(let image):
                // الصورة لما تحمل بنجاح
                image
                    .resizable()
                    .scaledToFill()
            case .failure:
                // لو حصل خطأ في تحميل الصورة
                ZStack {
                    Color.gray.opacity(0.2)
                    Image(systemName: "photo")
                        .foregroundColor(.gray)
                }
            @unknown default:
                EmptyView()
            }
        }
        .frame(height: 180)
        .cornerRadius(15)
        .padding(.horizontal)
    }
}